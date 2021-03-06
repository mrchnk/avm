/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
const NAME:String = 'String untyped append concat';

include '../timetest.as'

function append_concat(loops) {
    var x = '';
    for (var i=0; i<loops; i++) {
        x = x.concat('abcdefghijklmnopqrstuvwxyz0123456789');
    }
}

timetest(append_concat, 300000);

