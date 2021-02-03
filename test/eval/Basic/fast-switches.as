/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

// fast switches - this code triggers fast switch generation on 2009-03-03, at least.
// would be good to verify that it continues to do so...

// output should be 5 4 4 again default 2 1 2 0

for ( var i=5 ; i >= 0 ; i-- ) {
    switch (i) {
        case 0: print("0"); break;
        case 1: print("1"); // no break
        case 2: print("2"); break;
        case 1: print("3"); break;
        case 4: print("4");
            print("4 again"); break;
        case 5: print("5"); break;
        default: print("default"); break;
    }
}