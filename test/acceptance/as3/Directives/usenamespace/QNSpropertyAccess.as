/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
package{

var SECTION = "Directives";       // provide a document reference (ie, Actionscript section)
var VERSION = "AS 3.0";        // Version of ECMAScript or ActionScript
var TITLE   = "QNS Property Access";       // Provide ECMA section title or a description
//var BUGNUMBER = "";

startTest();                // leave this alone


public namespace T1;

class nsTest
{
    T1 var o = new Object();
    T1 function get x () { return "T1 ns";}
    public function get x () {return "public ns";}
    private function get z () {return "private var";}

    function nsTest()
    {
        T1::o.y = "hello y";
    }



}

var myTest = new nsTest;

var testResult:String = new String();

try {
    testResult = myTest.x;
} catch (e) {
    testResult = e;
} finally {
    AddTestCase( ". Lookup", "public ns", testResult);
}

try {
    testResult = myTest['x'];
} catch (e) {
    testResult = e;
} finally {
    AddTestCase( "[] Lookup", "public ns", testResult);
}

try {
    testResult = myTest.public::x;
} catch (e) {
    testResult = e;
} finally {
    AddTestCase( "explicit public ns Lookup", "public ns", testResult);
}

// bug 151552
//Added referenceError() so that the regress folder will not be different for release avmplus
//and release debugger avmplus should be modified after bug 151552 is fixed
try {
    testResult = myTest.public::['x'];
} catch (e:ReferenceError) {

    testResult = e;
} finally {
    AddTestCase( ".explicit public ns [] Lookup", "public ns", referenceError(testResult));
}

try {
    testResult = myTest.T1::x;
} catch (e) {
    testResult = e;
} finally {
    AddTestCase( ". ns lookup", "T1 ns", testResult);
}

try {
    testResult = myTest.T1::['x'];
} catch (e) {
    testResult = e;
} finally {
    AddTestCase( "[] ns lookup", "T1 ns", testResult);
}

try {
    testResult = myTest.T1::o.y;
} catch (e) {
    testResult = e;
} finally {
    AddTestCase( "subobject lookup using .", "hello y", testResult);
}

try {
    testResult = myTest.T1::['o']['y'];
} catch (e) {
    testResult = e;
} finally {
    AddTestCase( "subobject lookup using []", "hello y", testResult);
}

try {
    testResult = myTest.T1::['o'].y;
} catch (e) {
    testResult = e;
} finally {
    AddTestCase( "subobject lookup using []. combo", "hello y", testResult);
}

try {
    testResult = myTest.T1::o['y'];
} catch (e) {
    testResult = e;
} finally {
    AddTestCase( "subobject lookup using obj[] combo", "hello y", testResult);
}

test();       // leave this alone.  this executes the test cases and
              // displays results.
}
