/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
const NAME:String = 'XML appendChild from E4X';

var nodeCount:int = 1000;
var referenceResult:String = simpleStringConcatenation(nodeCount).toXMLString();

if (CONFIG::desktop) {
    var startTime:Number = new Date();
    var result:XML = usingAppendChildAndE4X(nodeCount);
    var totaltime:Number = new Date() - startTime;
} else {
    var startTime:Number = getTimer();
    var result:XML = usingAppendChildAndE4X(nodeCount);
    var totaltime:Number = getTimer() - startTime;
}
if (referenceResult != result.toXMLString()) {
    print("ERROR! XML does not match reference");
} else {
    REPORT(NAME, 'time', totaltime);
}


function usingAppendChildAndE4X(nodeCount:int):XML
{
    var xml:XML = <root />;

    for (var i:int = 0; i < nodeCount; i++) {
        xml.appendChild(<node id={i} />);
    }

    return xml;
}

function simpleStringConcatenation(nodeCount:int):XML
{
    var str:String = "<root>";

    for (var i:int = 0; i < nodeCount; i++) {
        str += "<node id=\"" + i + "\" />";
    }

    str += "</root>";

    return XML(str);
}
