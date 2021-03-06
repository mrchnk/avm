/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
const NITER:int=100000000;
const NAME:String='Number untyped Div';

function main():void
{
    var a:*=1.2;
	var b:*=2.4;
	var c:* = -3.2;
	var fstart:uint  = getTimer();
    for(var i:int=0;i<NITER;i++){
	    a = b/c;
		c = a/b;
		b = c/a;
	}
	var ftime:uint  = getTimer() - fstart;
	REPORT(NAME, 'time', ftime);
}

main();

