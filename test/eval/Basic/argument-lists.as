/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

function f1(a,b,c,d) {
    return a+b+c+d
}
print(f1(1,2,3,4));

function f1_typed(a:int,b:Number,c:Number,d:uint):Number {
    return a+b+c+d
}
print(f1_typed(1,2,3,4));

function f2(x, ...rest) {
    print(x);
    print(rest);
}
f2(1,2,3,4);

function f2_typed(x:Number, ...rest:Array) {
    print(x);
    print(rest);
}
f2_typed(1,2,3,4);
