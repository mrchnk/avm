/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

package TestPackage
{
    public const num1 = 1;
    public const num2 = 2;
}

var SECTION = "Definitions\const";                  // provide a document reference (ie, ECMA section)
var VERSION = "ActionScript 3.0";           // Version of JavaScript or ECMA
var TITLE   = "const in package";       // Provide ECMA section title or a description
var BUGNUMBER = "";

startTest();

import TestPackage.*;

AddTestCase("const in package", 3, num1 + num2);

test();
