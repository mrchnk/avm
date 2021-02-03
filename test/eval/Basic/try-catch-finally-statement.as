/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

function thrower() { throw "error" }
try {
    thrower();
    print("1 FAIL: after exception")
} catch (e) {
    print("1 OK: catch " + e);
} finally {
    print("1 OK: finally");
}

try {
    obj = null;
    print("2 OK: try");
} catch (e) {
    print("2 FAIL: catch");
}


try {
    print("3 OK: try");
} finally {
    print("3 OK: finally");
}