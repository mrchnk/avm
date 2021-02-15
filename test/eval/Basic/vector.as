/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

var x = new <Object>[new <int>[1], null, null];
print(x);
print(x.length);
print(x[0]);
print(x[1]);
print(x[2]);
x[1] = new <int> [1,2,3];
print(x[1]);
x[2] = new <int> [4,5,6];
print(x[2]);
