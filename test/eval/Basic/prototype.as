/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

function ww() {
    return this.x + "," + this.y
}
function c(x) {
    this.x = x;
    this.toString = ww;
}
c.prototype = { y: 20 };
print(new c(10));
