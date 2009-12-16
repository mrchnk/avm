# -*- test-case-name: buildbot.test.test_status -*-

from twisted.spread import pb
from twisted.python import components, log as twlog
from twisted.internet import reactor
from twisted.application import strports
from twisted.cred import portal, checkers

from buildbot import interfaces
from zope.interface import Interface, implements
from buildbot.status import builder, base
from buildbot.changes import changes

from buildbot.status.client import IRemote
from buildbot.status.client import StatusClientPerspective as SCP

# TODO: BuilderGroup should be moved out of aggregate... someday
from aggregateMailNotifier import BuilderGroup as BG

class BuilderGroup(BG):
    def __init__(self):
        BG.__init__(self)
        self.failures = False
        
        
    def reset(self):
        BG.reset(self)
        self.failures = False

class StatusClientPerspective(SCP):
    passBuilderGroups = []
    
    def setPassBuilderGroups(self, passBuilderGroups):
        self.passBuilderGroups = passBuilderGroups
    
    def getSourceStampDict(self, build):
        '''There are perspectivebroker Unpersistable issues with passing the build object,
        so as a workaround convert to a plain dictionary and pass the dictionary object.
        '''
        d = {}
        d['revision'] = build.getSourceStamp().revision
        d['branch'] = build.getSourceStamp().branch
        d['patch'] = build.getSourceStamp().patch
        
        # convert the changes into a passable object
        authors = []
        revisions = []
        comments = []
        
        for change in build.getSourceStamp().changes:
            authors.append(change.getShortAuthor())
            revisions.append(change.revision)
            comments.append(change.comments)
            
        d['authors'] = authors
        d['revisions'] = revisions
        d['comments'] = comments
        return d

    # override all StatusClientPerspective methods that pass a build object
    
    def buildStarted(self, name, build):
        self.client.callRemote("buildStarted", name, self.getSourceStampDict(build))
        if self.subscribed in ("steps", "logs", "full"):
            self.subscribed_to.append(build)
            return (self, self.interval)
        return None

    def buildFinished(self, name, build, results):
        if build in self.subscribed_to:
            # we might have joined during the build
            self.subscribed_to.remove(build)
        self.client.callRemote("buildFinished",
                               name, self.getSourceStampDict(build), results)
        
        # TODO: most of this code is copied from aggregateMailNotifier ... need to consolidate code
        if self.passBuilderGroups:
            currentBuilder = build.getBuilder()
            currentBuilderName = currentBuilder.getName()
            revision = build.getSourceStamp().revision
            
            for builderGroup in self.passBuilderGroups:
                if builderGroup.containsBuilder(currentBuilderName):
                    # if this is the first run, set the currentBuild when first called
                    if builderGroup.currentBuild == 0:
                        builderGroup.currentBuild = revision
                    if builderGroup.currentBuild == revision:
                        if results != 0:
                            builderGroup.failures = True
                        # Are there any builders left?
                        for builder in builderGroup.builderNames:
                            # The current builder will always have a building state,
                            # so do not check state if current builder
                            if builder != currentBuilderName:
                                state = self.status.getBuilder(builder).getState()[0]
                                if state == "building":     # if any are building we can return
                                    return
                        # Nothing is building - should we send out a pass notification?
                        if not builderGroup.failures:
                            self.client.callRemote("groupPass", self.getSourceStampDict(build) )
                        builderGroup.reset()
                        return
                    else:   # builderGroup.currentBuild != revision
                        # new revision - reset BuilderGroup just in case
                        builderGroup.reset()
                        builderGroup.currentBuild = revision
                    break
                        

    # mode >= steps
    def buildETAUpdate(self, build, eta):
        self.client.callRemote("buildETAUpdate",
                               build.getBuilder().getName(), self.getSourceStampDict(build),
                               eta)

    def stepStarted(self, build, step):
        # we add some information here so the client doesn't have to do an
        # extra round-trip
        self.client.callRemote("stepStarted",
                               build.getBuilder().getName(), self.getSourceStampDict(build),
                               step.getName(), IRemote(step))
        if self.subscribed in ("logs", "full"):
            self.subscribed_to.append(step)
            return (self, self.interval)
        return None

    def stepFinished(self, build, step, results):
        self.client.callRemote("stepFinished",
                               build.getBuilder().getName(), self.getSourceStampDict(build),
                               step.getName(), IRemote(step),
                               results)
        if step in self.subscribed_to:
            # eventually (through some new subscription method) we could
            # join in the middle of the step
            self.subscribed_to.remove(step)

    # mode >= logs
    def stepETAUpdate(self, build, step, ETA, expectations):
        self.client.callRemote("stepETAUpdate",
                               build.getBuilder().getName(), self.getSourceStampDict(build),
                               step.getName(), IRemote(step),
                               ETA, expectations)

    def logStarted(self, build, step, log):
        # TODO: make the HTMLLog adapter
        rlog = IRemote(log, None)
        if not rlog:
            print "hey, couldn't adapt %s to IRemote" % log
        self.client.callRemote("logStarted",
                               build.getBuilder().getName(), self.getSourceStampDict(build),
                               step.getName(), IRemote(step),
                               log.getName(), IRemote(log, None))
        if self.subscribed in ("full",):
            self.subscribed_to.append(log)
            return self
        return None

    def logFinished(self, build, step, log):
        self.client.callRemote("logFinished",
                               build.getBuilder().getName(), self.getSourceStampDict(build),
                               step.getName(), IRemote(step),
                               log.getName(), IRemote(log, None))
        if log in self.subscribed_to:
            self.subscribed_to.remove(log)

    # mode >= full
    def logChunk(self, build, step, log, channel, text):
        self.client.callRemote("logChunk",
                               build.getBuilder().getName(), self.getSourceStampDict(build),
                               step.getName(), IRemote(step),
                               log.getName(), IRemote(log),
                               channel, text)

class PBListener(base.StatusReceiverMultiService):
    """I am a listener for PB-based status clients."""

    compare_attrs = ["port", "cred"]
    implements(portal.IRealm)

    def __init__(self, port, user="statusClient", passwd="clientpw", denotesPassSchedulerGroups=None):
        '''
        port    : port for PBListener to listen on
        user    : PBListener username
        passwd  : PBListener password
        denotesPassSchedulerGroups : list of scheduler group(s) that when all builders pass indicates a passing build
        '''
        base.StatusReceiverMultiService.__init__(self)
        if type(port) is int:
            port = "tcp:%d" % port
        self.port = port
        self.cred = (user, passwd)
        p = portal.Portal(self)
        c = checkers.InMemoryUsernamePasswordDatabaseDontUse()
        c.addUser(user, passwd)
        p.registerChecker(c)
        f = pb.PBServerFactory(p)
        #TODO: not sure if i need this:
        f.unsafeTracebacks = True
        
        self.passBuilderGroups = []
        if denotesPassSchedulerGroups:
            self.setupDenotesPassSchedulerGroup(denotesPassSchedulerGroups)
        
        s = strports.service(port, f)
        s.setServiceParent(self)
        
    def setupDenotesPassSchedulerGroup(self, schedulerGroups):
        for schedulerGroup in schedulerGroups:
            group = BuilderGroup()
            if isinstance(schedulerGroup, list):    
                for scheduler in schedulerGroup:
                    group.addBuilderNames(scheduler.listBuilderNames())
            else:
                group.addBuilderNames(schedulerGroup.listBuilderNames())
            self.passBuilderGroups.append(group)

    def setServiceParent(self, parent):
        base.StatusReceiverMultiService.setServiceParent(self, parent)
        self.setup()

    def setup(self):
        self.status = self.parent.getStatus()

    def requestAvatar(self, avatarID, mind, interface):
        assert interface == pb.IPerspective
        p = StatusClientPerspective(self.status)
        p.setPassBuilderGroups(self.passBuilderGroups)
            
        
        p.attached(mind) # perhaps .callLater(0) ?
        return (pb.IPerspective, p,
                lambda p=p,mind=mind: p.detached(mind))
