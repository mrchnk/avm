/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
const NAME:String = 'String typed append plus_equal';

include '../timetest.as'

function append_plus_equal(loops:int):void {
    var x:String = '';
    for (var i:int=0; i<loops; i++) {
        x += 'abcdefghijklmnopqrstuvwxyz0123456789';
    }
}

timetest(append_plus_equal, 300000);