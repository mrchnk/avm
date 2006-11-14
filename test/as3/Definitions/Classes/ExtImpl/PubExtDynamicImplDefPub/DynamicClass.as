/* ***** BEGIN LICENSE BLOCK ***** 
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1 
 *
 * The contents of this file are subject to the Mozilla Public License Version 1.1 (the 
 * "License"); you may not use this file except in compliance with the License. You may obtain 
 * a copy of the License at http://www.mozilla.org/MPL/ 
 * 
 * Software distributed under the License is distributed on an "AS IS" basis, WITHOUT 
 * WARRANTY OF ANY KIND, either express or implied. See the License for the specific 
 * language governing rights and limitations under the License. 
 * 
 * The Original Code is [Open Source Virtual Machine.] 
 * 
 * The Initial Developer of the Original Code is Adobe System Incorporated.  Portions created 
 * by the Initial Developer are Copyright (C)[ 2004-2006 ] Adobe Systems Incorporated. All Rights 
 * Reserved. 
 * 
 * Contributor(s): Adobe AS3 Team
 * 
 * Alternatively, the contents of this file may be used under the terms of either the GNU 
 * General Public License Version 2 or later (the "GPL"), or the GNU Lesser General Public 
 * License Version 2.1 or later (the "LGPL"), in which case the provisions of the GPL or the 
 * LGPL are applicable instead of those above. If you wish to allow use of your version of this 
 * file only under the terms of either the GPL or the LGPL, and not to allow others to use your 
 * version of this file under the terms of the MPL, indicate your decision by deleting provisions 
 * above and replace them with the notice and other provisions required by the GPL or the 
 * LGPL. If you do not delete the provisions above, a recipient may use your version of this file 
 * under the terms of any one of the MPL, the GPL or the LGPL. 
 * 
 ***** END LICENSE BLOCK ***** */

package DynamicClass {


  dynamic class DynamicClassInner {

    var array:Array;
    var boolean:Boolean;
    var date:Date;
    var myFunction:Function;
    var math:Math;
    var number:Number;
    var object:Object;
    var string:String;

    public var pubArray:Array;
    public var pubBoolean:Boolean;
    public var pubDate:Date;
    public var pubFunction:Function;
    public var pubMath:Math;
    public var pubNumber:Number;
    public var pubObject:Object;
    public var pubString:String;

    private var privArray:Array;
    private var privBoolean:Boolean;
    private var privDate:Date;
    private var privFunction:Function;
    private var privMath:Math;
    private var privNumber:Number;
    private var privObject:Object;
    private var privString:String;

    static var statArray:Array;
    static var statBoolean:Boolean;
    static var statDate:Date;
    static var statFunction:Function;
    static var statMath:Math;
    static var statNumber:Number;
    static var statObject:Object;
    static var statString:String;

    internal var finArray:Array;
    internal var finBoolean:Boolean;
    internal var finDate:Date;
    internal var finFunction:Function;
    internal var finMath:Math;
    internal var finNumber:Number;
    internal var finObject:Object;
    internal var finString:String;

    public static var pubStatArray:Array;
    public static var pubStatBoolean:Boolean;
    public static var pubStatDate:Date;
    public static var pubStatFunction:Function;
    public static var pubStatMath:Math;
    public static var pubStatNumber:Number;
    public static var pubStatObject:Object;
    public static var pubStatString:String;

    private static var privStatArray:Array;
    private static var privStatBoolean:Boolean;
    private static var privStatDate:Date;
    private static var privStatFunction:Function;
    private static var privStatMath:Math;
    private static var privStatNumber:Number;
    private static var privStatObject:Object;
    private static var privStatString:String;

    // ****************
    // constructor
    // ****************

    function DynamicClass() {
    }

    // *****************
    // default methods
    // *****************

    function getArray() : Array { return array; }
    function getBoolean() : Boolean { return boolean; }
    function getDate() : Date { return date; }
    function getFunction() : Function { return myFunction; }
    function getMath() : Math { return math; }
    function getNumber() : Number { return number; }
    function getObject() : Object { return object; }
    function getString() : String { return string; }
    //function getSimple() : Simple { return simple; }

    function setArray( a:Array ) { array = a; }
    function setBoolean( b:Boolean ) { boolean = b; }
    function setDate( d:Date ) { date = d; }
    function setFunction( f:Function ) { myFunction = f; }
    function setMath( m:Math ) { math = m; }
    function setNumber( n:Number ) { number = n; }
    function setObject( o:Object ) { object = o; }
    function setString( s:String ) { string = s; }

    function setAll( a:Array,
                     b:Boolean,
                     d:Date,
                     f:Function,
                     m:Math,
                     n:Number,
                     o:Object,
                     s:String) {
        array = a;
        boolean = b;
        date = d;
        myFunction = f;
        math = m;
        number = n;
        object = o;
        string = s;
        simple = si;
    }

    // *******************
    // public methods
    // *******************

    public function setPubArray( a:Array ) { pubArray = a; }
    public function setPubBoolean( b:Boolean ) { pubBoolean = b; }
    public function setPubDate( d:Date ) { pubDate = d; }
    public function setPubFunction( f:Function ) { pubFunction = f; }
    public function setPubMath( m:Math ) { pubMath = m; }
    public function setPubNumber( n:Number ) { pubNumber = n; }
    public function setPubObject( o:Object ) { pubObject = o; }
    public function setPubString( s:String ) { pubString = s; }

    public function getPubArray() : Array { return this.pubArray; }
    public function getPubBoolean() : Boolean { return this.pubBoolean; }
    public function getPubDate() : Date { return this.pubDate; }
    public function getPubFunction() : Function { return this.pubFunction; }
    public function getPubMath() : Math { return this.pubMath; }
    public function getPubNumber() : Number { return this.pubNumber; }
    public function getPubObject() : Object { return this.pubObject; }
    public function getPubString() : String { return this.pubString; }

    // *******************
    // private methods
    // *******************

    private function getPrivArray() : Array { return privArray; }
    private function getPrivBoolean() : Boolean { return privBoolean; }
    private function getPrivDate() : Date { return privDate; }
    private function getPrivFunction() : Function { return privFunction; }
    private function getPrivMath() : Math { return privMath; }
    private function getPrivNumber() : Number { return privNumber; }
    private function getPrivObject() : Object { return privObject; }
    private function getPrivString() : String { return privString; }

    private function setPrivArray( a:Array ) { privArray = a; }
    private function setPrivBoolean( b:Boolean ) { privBoolean = b; }
    private function setPrivDate( d:Date ) { privDate = d; }
    private function setPrivFunction( f:Function ) { privFunction = f; }
    private function setPrivMath( m:Math ) { privMath = m; }
    private function setPrivNumber( n:Number ) { privNumber = n; }
    private function setPrivObject( o:Object ) { privObject = o; }
    private function setPrivString( s:String ) { privString = s; }

    // *******************
    // static methods
    // *******************

    static function setStatArray(a:Array) { statArray=a; }
    static function setStatBoolean( b:Boolean ) { statBoolean = b; }

    static function getStatArray() { return statArray; }


    // *******************
    // final methods
    // *******************

    final function setFinArray(a:Array) { finArray=a; }
    final function getFinArray() { return finArray; }


    // **************************
    // public static methods
    // **************************

    public static function setPubStatArray(a:Array) { pubStatArray=a; }
    public static function setPubStatBoolean( b:Boolean ) { pubStatBoolean = b; }

    public static function getPubStatArray() { return pubStatArray; }

    // **************************
    // private static methods
    // **************************

    private static function setPrivStatArray(a:Array) { privStatArray=a; }
    private static function setPrivStatBoolean( b:Boolean ) { privStatBoolean = b; }

    private static function getPrivStatArray() { return privStatArray; }
 }
  public class DynamicClass extends DynamicClassInner {}

}
