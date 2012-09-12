/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
 
 

import testdynfinalClassWithStringParamCons.*;

var SECTION = "Definitions";           // provide a document reference (ie, ECMA section)
var VERSION = "AS3";                   // Version of JavaScript or ECMA
var TITLE   = "Constructors with parameters of a Dynamic class";  // Provide ECMA section                                                                   //title or a description
var BUGNUMBER = "";

startTest();                // leave this alone


var x = "test";
var y:Boolean = true;
var myArray:Array = new Array(4,6,5);

/*public class publicClassCons{

      private var x:Number=4;
      private var y:Number=5;


      public function publicClassCons(){
      }

      public function Add(){
             private var z = x+y;
             return z;

                           
      }
}*/
import testdynfinalClassWithStringParamCons.publicClassCons;
var pbClCons:publicClassCons = new publicClassCons();

var MyDefaultClass:DefaultClass;
var dynWithStrParamCons=new dynfinClassWithStrParamCons(x,y,myArray,pbClCons,MyDefaultClass);
//print (dynWithStrParamCons.myString());
//print(x);
//print (dynWithStrParamCons.myBoolean());
//print(y);
//print (dynWithStrParamCons.myarray());
//print (myArray);
//print(dynWithStrParamCons.myAdd());

AddTestCase("calling public Instance method","test",dynWithStrParamCons.myString());
AddTestCase("calling public Instance method", true,dynWithStrParamCons.myBoolean());

AddTestCase("Array", myArray,dynWithStrParamCons.myarray());
AddTestCase("Calling public Instance method Add",9,dynWithStrParamCons.myAdd());




test();       // leave this alone.  this executes the test cases and
              // displays results.
