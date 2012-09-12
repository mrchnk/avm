/* -*- Mode: java; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 4 -*-
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

START("13.4.4.33 - XML setChildren()");

//TEST(1, true, XML.prototype.hasOwnProperty("setChildren"));

x1 =
<alpha>
    <bravo>one</bravo>
</alpha>;

correct =
<alpha>
    <charlie>two</charlie>
</alpha>;

x1.setChildren(<charlie>two</charlie>);

TEST(2, correct, x1);

// Replace the entire contents of Jim's employee element
emps =
<employees>
    <employee id="0"><name>Jim</name><age>25</age></employee>
    <employee id="1"><name>Joe</name><age>20</age></employee>
</employees>;

correct =
<employees>
    <employee id="0"><name>John</name><age>35</age></employee>
    <employee id="1"><name>Joe</name><age>20</age></employee>
</employees>;

emps.employee.(name == "Jim").setChildren(<name>John</name> + <age>35</age>);

TEST(3, correct, emps);

XML.prettyPrinting = false;
var xmlDoc = "<employee id='1'><firstname>John</firstname><lastname>Walton</lastname><age>25</age></employee>"
var xmlList = new XMLList ("<firstname>Paul</firstname><lastname>Betlem</lastname><age>35</age>");

// propertyName as a string
AddTestCase( "MYXML = new XML(xmlDoc), MYXML.setChildren(xmlList)",
    "<employee id=\"1\"><firstname>Paul</firstname><lastname>Betlem</lastname><age>35</age></employee>",
            (MYXML = new XML(xmlDoc), MYXML.setChildren(xmlList).toString()));

AddTestCase( "MYXML = new XML(xmlDoc), MYXML.setChildren(new XML (\"<firstname>Fred</firstname>\"))",
    "<employee id=\"1\"><firstname>Fred</firstname></employee>",
            (MYXML = new XML(xmlDoc), MYXML.setChildren(new XML ("<firstname>Fred</firstname>")).toString()));

AddTestCase( "MYXML = new XML(xmlDoc), MYXML.setChildren('simple string')",
    "simple string",
             (MYXML = new XML(xmlDoc), MYXML.setChildren("simple string").toString()));


END();
