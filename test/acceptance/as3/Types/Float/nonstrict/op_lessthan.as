/* -*- c-basic-offset: 4; indent-tabs-mode: nil; tab-width: 4 -*- */
/* vi: set ts=4 sw=4 expandtab: (add to ~/.vimrc: set modeline modelines=5) */
/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
include "floatUtil.as";


var SECTION = "6.7.5";
var VERSION = "AS3";
var TITLE   = "The < operator augmented by float values";

startTest();
writeHeaderToLog( SECTION + " "+ TITLE);

var nd:Number = 1.111111111119;
var nf:float = nd; // rounds up
var ns:String = "1.111111111119";
var nd_down:Number = 0.51;
var nf_down:float = 0.51; // rounds down
var ns_down:String = "0.51";
var nvo = new MyValueAlteringObject(nf);
var zero:float = 0f;
var zerof:float = 0.0;

AddStrictTestCase("Number<float (round up, true) strict check", true, nd<nf); // for the first test - we verify that it actually returns a boolean value
AddTestCase("float<Number (round up, true)", false, nf<nd);
AddStrictTestCase("String<float (round up, true) strict check", true, ns<nf);
AddTestCase("float<String (round up, true)", false, nf<ns);
AddStrictTestCase("Number<float (round down,false) strict check", false, nd_down<nf_down);
AddTestCase("float<Number (round down,false)", true, nf_down<nd_down);
AddStrictTestCase("String<float (round down,false) strict check", false, ns_down<nf_down);
AddTestCase("float<String (round down,false)", true, nf_down<ns_down);

// goes through float.toString()-> toNumber; should be equal
AddStrictTestCase("MyStringObject(float)<float strict check", false, new MyStringObject(nf)<nf);
AddTestCase("float<MyStringObject(float)", false, nf < new MyStringObject(nf));

// returns the float directly, should be equal
AddStrictTestCase("MyObject(float)<float strict check", false, new MyObject(nf_down)<nf_down);
AddTestCase("float<MyObject(float)", false, nf_down< new MyObject(nf_down));

/* This should be according to ECMA 262 11.8.1 The Greater-than Operator ( < )
--> lval < rval
    --> lval < rval with LeftFirst equal to true
        --> 1 < 2
            --> undefined return false, otherwise return result
                --> true
*/
AddStrictTestCase("Order of evaluation [<] (should return true)", true, nvo<nvo);

AddTestCase("float(itself)<float (false)", false, new float(nf)<nf);
AddTestCase("float<float(itself) (false)", false, nf<new float(nf));


AddTestCase("0.0f<-0.0f (false)", false, zero<(-zero) );
AddTestCase("0.0f FloatLiteral < -0.0f FloatLiteral (false)", false, 0f<(-0f) );
AddTestCase("-0.0f<0.0f (false)", false, (-zero)<zero);
AddTestCase("-0.0f FloatLiteral < 0.0f FloatLiteral (false)", false, (-0f)<0);
AddTestCase("-Inf<-Inf (false)", false, float.NEGATIVE_INFINITY<float.NEGATIVE_INFINITY);
AddTestCase("+Inf<+Inf (false)", false, float.POSITIVE_INFINITY<float.POSITIVE_INFINITY);
AddTestCase("-Inf<+Inf (true)", true, float.NEGATIVE_INFINITY<float.POSITIVE_INFINITY);
AddTestCase("+Inf<-Inf (false)", false, float.POSITIVE_INFINITY<float.NEGATIVE_INFINITY);
AddTestCase("0f<float.MIN_VALUE", true, zerof<float.MIN_VALUE);
AddTestCase("0f FloatLiteral<float.MIN_VALUE", true, 0f<float.MIN_VALUE);
AddTestCase("float.MIN_VALUE<float.MIN_VALUE", false, float.MIN_VALUE<float.MIN_VALUE);
AddTestCase("float.MAX_VALUE<float.POSITIVE_INFINITY", true, float.MAX_VALUE<float.POSITIVE_INFINITY);
AddTestCase("-float.MAX_VALUE<float.NEGATIVE_INFINITY", false, -float.MAX_VALUE<float.NEGATIVE_INFINITY);
AddTestCase("some_float<some_other_float", true, nf_down<nf);
AddTestCase("some_float<-some_other_float", false, nf_down<(-nf));

AddTestCase("-Inf<NaN (false)", false, float.NEGATIVE_INFINITY<float.NaN);
AddTestCase("NaN<+Inf (false)", false, float.NaN<float.POSITIVE_INFINITY);
AddTestCase("NaN<NaN (false)", false, float.NaN<float.NaN);

var myFloat:float = 3.14f;
AddTestCase("float<Number(float) (false, should be equal)", false, myFloat<Number(myFloat));
AddTestCase("Number(float)<myFloat (false, should be equal)", false, Number(myFloat)<myFloat);


test();

