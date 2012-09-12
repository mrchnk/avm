/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
/*
    In Ecma4 there are three sealed types; Boolean, Number and String
    You cannot set properties of an instance of a sealed type

    Should throw a ReferenceError

*/
    var SECTION = "ECMA_4";
    var VERSION = "ECMA_4";
    startTest();
    var TITLE   = "tostr=Boolean.prototype.toString;x=true;x.toString=tostr;";
    writeHeaderToLog( TITLE );

    var testcases = getTestCases();
    test();

function getTestCases() {
    var array = new Array();
    var item = 0;
    var thisError:String="no error";

    try{
        var tostr=Boolean.prototype.toString;
        var x:Boolean=true;
        x.prototype=tostr;
    } catch (e:ReferenceError) {
        thisError = e.toString();
    } finally {
        array[item++] =new TestCase(SECTION,"Cannot set property on an instance of Boolean","ReferenceError: Error #1056",referenceError( thisError ) );
    }
    return ( array );
}
