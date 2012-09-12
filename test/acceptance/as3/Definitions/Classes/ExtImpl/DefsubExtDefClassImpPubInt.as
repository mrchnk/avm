/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import DefClassImpPublicInt.*;
var SECTION = "Definitions";       // provide a document reference (ie, Actionscript section)
var VERSION = "AS3";        // Version of ECMAScript or ActionScript
var TITLE   = "Default class implements public interface";       // Provide ECMA section title or a description
var BUGNUMBER = "";

startTest();                // leave this alone

/**
 * Calls to AddTestCase here. AddTestCase is a function that is defined
 * in shell.js and takes three arguments:
 * - a string representation of what is being tested
 * - the expected result
 * - the actual result
 *
 * For example, a test might look like this:
 *
 * var helloWorld = "Hello World";
 *
 * AddTestCase(
 * "var helloWorld = 'Hello World'",   // description of the test
 *  "Hello World",                     // expected result
 *  helloWorld );                      // actual result
 *
 */

///////////////////////////////////////////////////////////////
// add your tests here
  
var obj = new DefaultsubClassAccessor();
//use namespace ns;

//Default sub class extends Default class that implements a default interface with a default //method
AddTestCase("Default class implements an public interface with a default method", "PASSED", obj.accdeffunc());
//AddTestCase("Default class implements an public interface with a default method", 10, obj.accdeffunc2());
AddTestCase("Default class implements an public interface with a default method", 20, obj.accdeffunc3());
AddTestCase("Default sub class extends Default class that implements a public interface with a default method", "PASSED", obj.accsupdeffunc());

//Default sub class extends Default class that implements a default interface with a public //method
AddTestCase("Default sub class extends Default class that implements a public interface with a public method", false, obj.pubFunc());

//Default sub class extendsDefault class implements a default interface with a namespace //method
AddTestCase("Default sub class extends Default class that implements an public interface with a namespace method", 4, obj.accnsFunc());

////////////////////////////////////////////////////////////////

test();       // leave this alone.  this executes the test cases and
              // displays results.
