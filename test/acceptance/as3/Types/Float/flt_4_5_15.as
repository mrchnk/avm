/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
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
 * Portions created by the Initial Developer are Copyright (C) 2011
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
include "floatUtil.as";


var SECTION = "4.5.15";
var VERSION = "AS3";
var TITLE   = "public function abs(x:float):float";

startTest();
writeHeaderToLog( SECTION + " "+ TITLE);


AddTestCase("float.abs() returns a float", "float", getQualifiedClassName(float.abs(0)));
AddTestCase("float.abs() length is 1", 1, float.abs.length);
AddErrorTest("float.abs() with no args", ARGUMENTERROR+1063,  function(){ float.abs(); });

var pi_fl = 3.14f;
AddTestCase("float.abs(-FloatLiteral)", pi_fl, float.abs(-pi_fl));
AddTestCase("float.abs(FloatLiteral)", pi_fl, float.abs(pi_fl));
var pi_f:float = 3.14f;
AddTestCase("float.abs(-typed)", pi_f, float.abs(-pi_f));
AddTestCase("float.abs(typed)", pi_f, float.abs(pi_f));

AddTestCase("float.abs(undefined)", float.NaN, float.abs(undefined));
AddTestCase("float.abs(null)", float(0), float.abs(null));
AddTestCase("float.abs(true)", float(1), float.abs(true));
AddTestCase("float.abs(false)", float(0), float.abs(false));
AddTestCase("float.abs(string)", float.NaN, float.abs("string"));
AddTestCase("float.abs(float.NaN)", float.NaN, float.abs(float.NaN));

AddTestCase("float.abs('1')", float(1), float.abs('1'));
AddTestCase("float.abs('0')", float(0), float.abs('0'));
AddTestCase("float.INFINITY/float.abs('0')", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/float.abs('0'));

AddTestCase("float.abs(0.0f)", float(0), float.abs(0.0f));
AddTestCase("float.INFINITY/float.abs(0.0f)", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/float.abs(0.0f));
AddTestCase("float.abs(-0.0f)", float(0), float.abs(-0.0f));
AddTestCase("float.INFINITY/float.abs(-0.0f)", float.POSITIVE_INFINITY, float.POSITIVE_INFINITY/float.abs(-0.0f));

AddTestCase("float.abs(float.NEGATIVE_INFINITY)", float.POSITIVE_INFINITY, float.abs(float.NEGATIVE_INFINITY));
AddTestCase("float.abs(float.POSITIVE_INFINITY)", float.POSITIVE_INFINITY, float.abs(float.POSITIVE_INFINITY));
AddTestCase("float.abs(-float.MIN_VALUE)", float.MIN_VALUE, float.abs(-float.MIN_VALUE));
AddTestCase("float.abs(-float.MAX_VALUE)", float.MAX_VALUE, float.abs(-float.MAX_VALUE));
AddTestCase("float.abs(float.MIN_VALUE)", float.MIN_VALUE, float.abs(float.MIN_VALUE));
AddTestCase("float.abs(float.MAX_VALUE)", float.MAX_VALUE, float.abs(float.MAX_VALUE));



test();
