/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
 
 

import testpublicClassInitializer.*;

var SECTION = "Definitions";           // provide a document reference (ie, ECMA section)
var VERSION = "AS3";                   // Version of JavaScript or ECMA
var TITLE   = "Class Initializers";  // Provide ECMA section title or a description
var BUGNUMBER = "";

startTest();                // leave this alone

var testInit= new testClassInitializersWrap();
//print(testInit.MyNumber1());
//print(testInit.MyNumber2());
//print();
AddTestCase("Result from for loop",1,testInit.MyNumber1());
AddTestCase("Result from if else stt",2,testInit.MyNumber2());
AddTestCase("Result from do loop",2,testInit.MyNumber3());
test();       // leave this alone.  this executes the test cases and
              // displays results.
