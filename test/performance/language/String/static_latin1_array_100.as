/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
const NAME:String = 'String latin1 static access 100%';

include 'timetest.as';
include 'latin1.as';

// 100% coverage of all static strings
 
function test_Latin1_100(loops)
{
    for (var i = 0; i < loops; i++)
    {
        testLatin1_1();
        testLatin1_2();
    }
}

if (CONFIG::desktop) {
    var loops = 1000;
} else {
    var loops = 100;
}

timetest(test_Latin1_100, loops);
