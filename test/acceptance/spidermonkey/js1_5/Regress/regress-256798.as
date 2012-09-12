/* -*- Mode: C++; tab-width: 2; indent-tabs-mode: nil; c-basic-offset: 2 -*- */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

startTest();

var gTestfile = 'regress-256798.js';
//-----------------------------------------------------------------------------
var BUGNUMBER = 256798;
var summary = 'regexp zero-width positive lookahead';
var actual = '';
var expect = '';

printBugNumber(BUGNUMBER);
printStatus (summary);

var status;

status = summary + ' ' + inSection(1);
expect = 'aaaa,a';
actual = /(?:(a)+)/.exec("baaaa") + '';
AddTestCase(status, expect, actual);

status = summary + ' ' + inSection(2);
expect = ',aaa';
actual = /(?=(a+))/.exec("baaabac") + '';
AddTestCase(status, expect, actual);

status = summary + ' ' + inSection(3);
expect = 'b,aaa';
actual = /b(?=(a+))/.exec("baaabac") + '';
AddTestCase(status, expect, actual);

// XXXbc revisit this
status = summary + ' ' + inSection(4);
expect = 'null';
actual = /b(?=(b+))/.exec("baaabac") + '';
AddTestCase(status, expect, actual);

test();
