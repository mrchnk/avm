/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
    var SECTION = "15.9.5.32-1";
    var VERSION = "ECMA_1";
    startTest();

    writeHeaderToLog( SECTION + " Date.prototype.setDate(date) ");
    var testcases:Array = getTestCases();
    test();


function getTestCases() {
    var array = new Array();
    var item = 0;
    addNewTestCase( 0, 1,
                    "TDATE = new Date(0);(TDATE).setDate(1);TDATE" );
    addNewTestCase( 0, 31,
                    "TDATE = new Date(0);(TDATE).setDate(31);TDATE" );
    addNewTestCase( 86400000, 31,
                    "TDATE = new Date(86400000);(TDATE).setDate(31);TDATE" );
    addNewTestCase( 86400000, 1,
                    "TDATE = new Date(86400000);(TDATE).setDate(1);TDATE" );
    addNewTestCase( 28800000, 1,
                    "TDATE = new Date(28800000);(TDATE).setDate(1);TDATE" );
    addNewTestCase( 28800000, 31,
                    "TDATE = new Date(28800000);(TDATE).setDate(31);TDATE" );
    addNewTestCase( 946684800000, 1,
                    "TDATE = new Date(946684800000);(TDATE).setDate(1);TDATE" );
    addNewTestCase( 946684800000,31,
                    "TDATE = new Date(946684800000);(TDATE).setDate(31);TDATE" );

    addNewTestCase( -2208988800000,1,
                    "TDATE = new Date(-2208988800000);(TDATE).setDate(1);TDATE" );

    addNewTestCase( -2208988800000,31,
                    "TDATE = new Date(-2208988800000);(TDATE).setDate(31);TDATE" );

    function addNewTestCase( t, d, DateString ) {
        var DateCase:Date = new Date( t );
        DateCase.setDate( d );
        var UTCDate = UTCDateFromTime(SetDate(t, d));
        var LocalDate=LocalDateFromTime(SetDate(t,d));
    
        array[item++] = new TestCase( SECTION, DateString + ".getTime()",             UTCDate.value,       DateCase.getTime() );
        array[item++] = new TestCase( SECTION, DateString + ".valueOf()",             UTCDate.value,       DateCase.valueOf() );
    
        array[item++] = new TestCase( SECTION, DateString + ".getUTCFullYear()",      UTCDate.year,   DateCase.getUTCFullYear() );
        array[item++] = new TestCase( SECTION, DateString + ".getUTCMonth()",         UTCDate.month,  DateCase.getUTCMonth() );
        array[item++] = new TestCase( SECTION, DateString + ".getUTCDate()",          UTCDate.date,   DateCase.getUTCDate() );
        array[item++] = new TestCase( SECTION, DateString + ".getUTCDay()",           UTCDate.day,    DateCase.getUTCDay() );
        array[item++] = new TestCase( SECTION, DateString + ".getUTCHours()",         UTCDate.hours,  DateCase.getUTCHours() );
        array[item++] = new TestCase( SECTION, DateString + ".getUTCMinutes()",       UTCDate.minutes,DateCase.getUTCMinutes() );
        array[item++] = new TestCase( SECTION, DateString + ".getUTCSeconds()",       UTCDate.seconds,DateCase.getUTCSeconds() );
        array[item++] = new TestCase( SECTION, DateString + ".getUTCMilliseconds()",  UTCDate.ms,     DateCase.getUTCMilliseconds() );
    
        array[item++] = new TestCase( SECTION, DateString + ".getFullYear()",         LocalDate.year,       DateCase.getFullYear() );
        array[item++] = new TestCase( SECTION, DateString + ".getMonth()",            LocalDate.month,      DateCase.getMonth() );
        array[item++] = new TestCase( SECTION, DateString + ".getDate()",             LocalDate.date,       DateCase.getDate() );
        array[item++] = new TestCase( SECTION, DateString + ".getDay()",              LocalDate.day,        DateCase.getDay() );
        array[item++] = new TestCase( SECTION, DateString + ".getHours()",            LocalDate.hours,      DateCase.getHours() );
        array[item++] = new TestCase( SECTION, DateString + ".getMinutes()",          LocalDate.minutes,    DateCase.getMinutes() );
        array[item++] = new TestCase( SECTION, DateString + ".getSeconds()",          LocalDate.seconds,    DateCase.getSeconds() );
        array[item++] = new TestCase( SECTION, DateString + ".getMilliseconds()",     LocalDate.ms,         DateCase.getMilliseconds() );
    
        if (!as3Enabled) {
            DateCase.toString = Object.prototype.toString;
            array[item++]  =new TestCase(SECTION,"DateCase.toString = Object.prototype.toString; DateCase.toString()","[object Date]", DateCase.toString() );
        
            array[item++] = new TestCase( SECTION,
                                              "DateString.toString=Object.prototype.toString;DateString.toString()",
                                              "[object Date]",
                                              (DateCase.myToString = Object.prototype.toString, DateCase.myToString()));
        }
    }
    return array;
}
function MyDate() {
    this.year = 0;
    this.month = 0;
    this.date = 0;
    this.hours = 0;
    this.minutes = 0;
    this.seconds = 0;
    this.ms = 0;
}
function LocalDateFromTime(t) {
    t = LocalTime(t);
    return ( MyDateFromTime(t) );
}
function UTCDateFromTime(t) {
 return ( MyDateFromTime(t) );
}
function MyDateFromTime( t ) {
    var d = new MyDate();
    d.year = YearFromTime(t);
    d.month = MonthFromTime(t);
    d.date = DateFromTime(t);
    d.hours = HourFromTime(t);
    d.minutes = MinFromTime(t);
    d.seconds = SecFromTime(t);
    d.ms = msFromTime(t);

    d.time = MakeTime( d.hours, d.minutes, d.seconds, d.ms );
    d.value = TimeClip( MakeDate( MakeDay( d.year, d.month, d.date ), d.time ) );
    d.day = WeekDay( d.value );

    return (d);
}

function SetDate( t, date ) {
    var T       = LocalTime( t );
    var DATE    = Number( date );
    var RESULT3 = MakeDay(YearFromTime(T), MonthFromTime(T), DATE );
    var UTC_DATE = UTC( MakeDate(RESULT3, TimeWithinDay(T)) );
    return ( TimeClip(UTC_DATE) );
}
