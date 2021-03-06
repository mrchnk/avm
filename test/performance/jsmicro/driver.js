/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

// Run the function 'run' until at least a second has passed.  The
// metric is the number of iterations per second, rounded down.

function TEST(run, tag) {
    var then = new Date();
    var iterations = 0;
    for (;;) {
	var now = new Date();
	if (now - then > 1000.0)
	    break;
	iterations++;
	run();
    }
    REPORT(tag, 'iterations/second', iterations/((now-then)/1000.0));
}

// Run the function 'init' and then the function 'run', and accumulate
// the time spent in the latter until at least a second has passed.
// The metric is the number of iterations per second, rounded down.

function TEST3(init, run, tag) {
    var time = 0;
    var iterations = 0;
    for (;;) {
	if (time > 1000.0)
	    break;
	iterations++;
	init();
	var then = new Date();
	run();
	var now = new Date();
	time += (now - then);
    }
    REPORT(tag, 'iterations/second', iterations/((time)/1000.0));
}
