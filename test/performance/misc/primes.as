/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

const NAME: String = 'primes';

function prime(n: int) {
    var m: int = n;
    var limit: int = n / 2;
    for (var i: int = 2; i <= limit; ++i) {
        if (!(m % i)) {
            return false;
        }
    }
    return true;
}

if (CONFIG::desktop) {
    var n: int = 100000;
    var start: Number = new Date();
} else { // mobile
    var n: int = 10000;
    var start: int = getTimer();
}

var numprimes: int = 0;

print("searching for primes 1.." + n)
for (var j: int = n; j > 0; --j) {
    if (prime(j)) {
        numprimes++;
    }
}
print("found " + numprimes);

if (CONFIG::desktop)
    REPORT(NAME, "time", new Date() - start);
else // mobile
    print("metric time " + (getTimer() - start));


