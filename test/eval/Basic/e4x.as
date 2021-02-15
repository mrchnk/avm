/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

order =
    <order>
        <customer>
            <name>John Smith</name>
        </customer>
        <item id="1">
            <description>Big Screen Television</description>
            <price>1299.99</price>
        </item>
        <item id="2">
            <description>DVD Player</description>
            <price>399.99</price>
        </item>
    </order>;
print(order);

alpha =
    <alpha attr1="value1" attr2="value2">
        <bravo>
            one
            <charlie>two</charlie>
        </bravo>
    </alpha>;
print(alpha..*);

employees =
    <employees>
        <employee id="0">
            <fname>John</fname>
            <age>20</age>
        </employee>
        <employee id="1">
            <fname>Sue</fname>
            <age>30</age>
        </employee>
    </employees>;

john = employees.employee.(fname == "John");
print(john);
