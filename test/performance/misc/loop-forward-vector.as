/* -*- Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
import flash.utils.ByteArray;
import avmplus.*;
include "driver.as";

var NAME = 'loop-forward-vector';
var DESC = "Vector forward int sum loop, 2048 elements";

var v: Vector.<int> = new Vector.<int>(2048);
for ( var i:int=0 ; i < 2048 ; i++ )
    v[i] = 1;

TEST(main, NAME);

function main()
{
    var sum:int=0;
    for ( var inner:int = 0 ; inner < 2048 ; inner++ )
        sum += v[inner];

    if (sum != 2048)
        throw DESC + ": Unexpected result: " + sum;
}
