/* -*- Mode: C++; c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is [Open Source Virtual Machine.].
 *
 * The Initial Developer of the Original Code is
 * Adobe System Incorporated.
 * Portions created by the Initial Developer are Copyright (C) 2010
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *   Adobe AS3 Team
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */

var DESC = "Compute float.reciprocal of a large Vector.<float>";
include "driver.as"

function float_reciprocal(iter: int, a: Vector.<float>): float
{
    // Please do not change or remove the type annotation
    // Please do not change the indexing expressions or updates.
    var tmp1:float;
    var tmp2:float;
    var tmp3:float;
    var tmp4:float;
    var tmp5:float;
    for ( var i:int = 0 ; i < iter ; i++ ) {
        for ( var j:int = 0 ; j < 1000 ; ) {
            tmp1 = a[j];  tmp1 = float.reciprocal(tmp1); j++;
            tmp2 = a[j];  tmp2 = float.reciprocal(tmp2); j++;
            tmp3 = a[j];  tmp3 = float.reciprocal(tmp3); j++;
            tmp4 = a[j];  tmp4 = float.reciprocal(tmp4); j++;
            tmp5 = a[j];  tmp5 = float.reciprocal(tmp5); j++;
        }
    }
    return tmp1+tmp2+tmp3+tmp4+tmp5;
}

function init() {
    var v:Vector.<float> = new Vector.<float>(1000)
    for (var i:uint = 0, len:uint = v.length; i < len; ++i)
        v[i] = float((i & 1) ? i : -i);
    return v
}

var v: Vector.<float> = init()

TEST(function () { float_reciprocal(1000, v); }, "float-reciprocal");