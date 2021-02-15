/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package avmplus {

    import flash.utils.ByteArray;

    // this class exists solely to test native classes that use MI.
    [native(cls="::avmshell::MIClass", instance="::avmshell::MIObject", methods="::avmshell::MIObjectImpl")]
    internal class MI
    {
        public native function plus(i:Number):Number;
    }

    [native(cls="::avmshell::SystemClass", classgc="exact", methods="auto", construct="none")]
    public class System
    {
        // this metadata exists solely so that nativegen.py will encounter it during shell building,
        // thus giving us a test case for metadata parsing in nativegen.py
        [foo]
        public native static function exit(status:int):void

        // this metadata exists solely so that nativegen.py will encounter it during shell building,
        // thus giving us a test case for metadata parsing in nativegen.py
        [bar(attr="whatever")]
        public native static function exec(command:String):int
	    /**
	    * Do nothing in this process for some time.
	    *
	    * @param ms  A timeout value in milliseconds. Negative values are taken to be zero.
	    */
	    public native static function sleep(ms:int): void;
        public native static function getAvmplusVersion():String
        public native static function getFeatures():String
        public native static function getRunmode():String
        public native static function trace(a:Array):void
        public native static function write(s:String):void
        public native static function debugger():void
        public native static function isDebugger():Boolean
        public native static function getNanosecondTimer():Number
        public native static function getTimer():uint
        private native static function getArgv():Array
        public static const argv:Array = getArgv();
        public native static function readLine():String;

        // Amount of real memory we've aqcuired from the OS
        public native static function get totalMemory():Number;

        // Part of totalMemory we aren't using
        public native static function get freeMemory():Number;

        // process wide size of resident private memory
        public native static function get privateMemory():Number;

        // Initiate a garbage collection; future versions will not return before completed.
        public native static function forceFullCollection():void;

        // Queue a garbage collection request.
        public native static function queueCollection():void;

        // function exists solely to test native-methods with custom namespaces
        ns_example native static function nstest():void;

        // function exists solely to test ScriptObject::isGlobalObject
        public native static function isGlobal(o:Object):Boolean;

        // return the value passed to -swfversion at launch (or the default value, if -swfversion was not specified)
        public native static function get swfVersion():int;

        // return the value passed to -api at launch (or the default value, if -api was not specified)
        public native static function get apiVersion():int;

        public native static function disposeXML(xml:XML):void;

        // DEOPT: Diagnostic scaffolding.
        public native static function deopt(n:int):void;

        /**
         * Suggest to the garbage collector that if collector's imminence
         * exceeds imminence parameter then the collector should finish
         * the incremental collection cycle.  Doing so may incur a pause.
         *
         * @param imminence  A number between 0 and 1 where 0 means less imminent and 1 means most imminent
         *
         * @note The API is provided to allow the program to help the GC schedule GC pauses, thereby
         * working around a weakness in the garbage collector: though the GC is incremental, there is
         * still the chance of longer-than-desired pauses in some situations.  Scheduling those pauses
         * at points where the user won't notice or won't care (program phase transitions, say)
         * makes for a smoother user experience.
         */
        public static native function pauseForGCIfCollectionImminent(imminence:Number=0.75): void;

        // Support for VM tests that depend on representation of numeric atoms.
        // These are provided solely for testing purposes, as the semantics of an AS3 program
        // should not depend on the word size of the platform nor the internal encoding of atoms.

        // Return true if running on a 64-bit platform.
        public native static function is64bit(): Boolean;

        // Return true if the argument is an atom with tag kIntptrType.
        public native static function isIntptr(a:*): Boolean;
        public native static function runInSafepoint(code:Function):void;

        // Return argument value as a kIntptrType atom if the argument is a numeric
        // value that can be so represented, else return the argument unchanged.
        public native static function canonicalizeNumber(a:*):*;
    }

    [native(cls="::avmshell::FileClass", methods="auto", construct="none")]
    public class File
    {
        public native static function exists(filename:String):Boolean;
        public native static function read(filename:String):String;
        public native static function write(filename:String, data:String):void;

        public native static function readByteArray(filename:String):ByteArray;
        public native static function writeByteArray(filename:String, bytes:ByteArray):Boolean;
    }

    public function debugger()
    {
        System.debugger()
    }
}

package {

    import avmplus.*

    public function getClassByName(name:String):Class
    {
        return Domain.currentDomain.getClass(name);
    }

    // nonstandard extensions to ECMAScript
    public function print(...s)
    {
        System.trace(s)
    }

    // nonstandard Flash Player extensions
    public function trace(...s)
    {
        System.trace(s)
    }

    public function getTimer():uint
    {
        return System.getTimer()
    }

    public function readLine():String
    {
        return System.readLine()
    }

    // DEOPT: Diagnostic scaffolding.
    public function deopt(k):void
    {
        System.deopt(k);
    }

}