/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import InternalClassPackage.*;


var SECTION = "Definitions";                                // provide a document reference (ie, ECMA section)
var VERSION = "AS 3.0";                                 // Version of JavaScript or ECMA
var TITLE   = "Override public function in dynamic class extending internal class";     // Provide ECMA section title or a description
var BUGNUMBER = "";

startTest();                                            // leave this alone


var CLASSDEFN = new DynExtInternalOverRidePublic();
var booleanValue:Boolean = true;

AddTestCase( "CLASSDEFN.setBoolean( booleanValue ); CLASSDEFN.getBoolean()", booleanValue, ( CLASSDEFN.setBoolean( booleanValue ), CLASSDEFN.getBoolean() ) );
AddTestCase( "CLASSDEFN.orSet", true, CLASSDEFN.orSet );
AddTestCase( "CLASSDEFN.orGet", true, CLASSDEFN.orGet );


test();             // Leave this function alone.
            // This function is for executing the test case and then
            // displaying the result on to the console or the LOG file.
