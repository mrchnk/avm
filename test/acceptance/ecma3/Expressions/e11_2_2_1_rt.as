/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

    var SECTION = "11_2_2_1_n";
    var VERSION = "ECMA_1";
    startTest();
    var TITLE   = "The new operator";

    writeHeaderToLog( SECTION + " "+ TITLE);

    var testcases = getTestCases();
    test();
    
function getTestCases() {
    var array = new Array();
    var item = 0;


    var OBJECT = new Object();

    try{
       var o = new OBJECT();
    }catch(e:Error){
       thisError = e.toString();
    }finally{
       array[item++] = new TestCase( SECTION,
                                    "var m = new OBJECT()",
                                    "TypeError: Error #1007",
                                    typeError(thisError) );
     }

    /*array[item++] = new TestCase( SECTION,
                                    "OBJECT = new Object; var o = new OBJECT()",
                                    "error",
                                    o = new OBJECT() );*/
    return array;
}

function TestFunction() {
    return arguments;
}
