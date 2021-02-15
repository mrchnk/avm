/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

function f() { print(this) }
f();
f.call("hello");
f.apply("world", []);


function h() {
    function g() { return this }
    var i = g()
    return i == this
}

print(h())