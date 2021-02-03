/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

function fib(n) {
    if (n < 2)
        return n;
    else
        return fib(n-1) + fib(n-2);
}

print(fib(7));
