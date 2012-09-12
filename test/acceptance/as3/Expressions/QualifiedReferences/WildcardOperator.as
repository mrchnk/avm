/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

var SECTION = "Expressions";       // provide a document reference (ie, Actionscript section)
var VERSION = "AS 3.0";        // Version of ECMAScript or ActionScript
var TITLE   = "Wildcard operator on non-XML object - runtime error";       // Provide ECMA section title or a description
var BUGNUMBER = "";

startTest();                // leave this alone



var employees = [{fname:"John",age:20},{fname:"Sue",age:30}]
try {
    var names = employees.*;
    result = "no exception";
} catch(e1) {
    result = referenceError(e1.toString());
}

expected = "ReferenceError: Error #1081";

AddTestCase("Use wildcard operator on an array", expected, result);

var object = {a:1, b:2, c:3};

try {
    var names = object.*;
    result = "no exception";
} catch(e2) {
    result = referenceError(e2.toString());
}

expected = "ReferenceError: Error #1081";

AddTestCase("Use wildcard operator on an object", expected, result);

var string = "this is a string";

try {
    var names = string.*;
    result = "no exception";
} catch(e3) {
    result = referenceError(e3.toString());
}

expected = "ReferenceError: Error #1069";

AddTestCase("Use wildcard operator on a string", expected, result);

 test();
