/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

var y : Vector.<int> = new <int> [1,2,3];
print(y);

var err = false;
try {
    y = new <Number> [1,2,3]; // not compatible
}
catch (e) {
    err = e;
}

if (err)
    print("OK: " + err);
else
    print("FAIL: type check skipped");
