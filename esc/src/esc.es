/* -*- mode: java; tab-width: 4; insert-tabs-mode: nil; indent-tabs-mode: nil;  -*- */
/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is [Open Source Virtual Machine.].
 *
 * The Initial Developer of the Original Code is
 * Adobe System Incorporated.
 * Portions created by the Initial Developer are Copyright (C) 2004-2006
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   Adobe AS3 Team
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */

{
    import avmplus.*;
    var fname = System.argv[0];
    var str = File.read (fname);
    //print ("compiling ", fname);
}

{
    import avmplus.*;
    use namespace Parse;
    use namespace Gen;
    var esc_env_str = File.read ("esc-env.ast");
    var parser = new Parser(esc_env_str,[]);
    var [ts,nd] = parser.program();
    nd.Ast::file = "esc-env.ast";  // or the AVM flips out if debugging is enabled
    var bytes = cg(nd).getBytes();
    Domain.currentDomain.loadBytes(bytes);
}

// decode it

{
    use namespace Ast;
    //print ("decoding esc_env ",esc_env.ast_class);
    var nd = Decode::program (esc_env);  // defined by side effect
    var topFixtures = nd.head.fixtures;
}

{
    use namespace Parse;
    //print ("parsing");
    var t1 = new Date;
    var parser = new Parser(str,topFixtures);
    var [ts,nd] = parser.program();
    var t2 = new Date;
    //print (fname+" parse "+(t2-t1)+" ms");
}

{
    //print ("gening");
    nd.Ast::file = fname;
    var bytes = Gen::cg(nd);
    var t3 = new Date;
    //print (fname+" cogen "+(t3-t2)+" ms");
    //print ("writing");
    var len = dumpABCFile(bytes, fname+".abc");
    print (fname+", "+(t3-t1)+" ms, "+len+" bytes written");
}
