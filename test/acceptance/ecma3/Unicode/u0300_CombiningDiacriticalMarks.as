/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
include "unicodeUtil.as";
include "unicodeNegativeUtil.as";

var SECTION = "Combining Diacritical Marks";
var VERSION = "ECMA_3";
startTest();
var TITLE = "Test String functions (search, match, split, replace) on all unicode characters";

writeHeaderToLog(SECTION + " "+ TITLE);

var array = new Array();
var item = 0;
getTestCases();

var testcases = array;
test();

function getTestCases():void {
  // Combining Diacritical Marks
  testUnicodeRange(0x0300, 0x036F);
  negativeTestUnicodeRange(0x0300, 0x036F);
}
