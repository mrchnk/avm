/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

print({ "foo": 10, bar: 20 }.foo);
print({ "foo": 10, bar: 20 }.bar);
print(["a","b",,"c",,].length); // should be 5
print(["a","b",,"c",,][0]); // should be "a"
