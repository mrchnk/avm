/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

var j=0;
forloop:
    for (var i=0;i<10;i++)
        while (true) {
            if (j > 3)
                continue forloop;
            j++;
        }

print(i, j); // 10, 4