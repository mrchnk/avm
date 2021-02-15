/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

function f() {
    print(arguments);
}
f(1,2,3,4)

var g = function (x) {
    print(arguments);
    return arguments.callee;
}
print(g(5));
