/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

for ( var i=17 in [] )
    print(i);

print(i);

var obj = ["a","b","c"]
for ( var i=33 in obj )
    print(i + "=" + obj[i]);
