﻿include 'timetest.as'var size = 700;var str;for (var i=0; i < size; i++)    str += "(123) 456-7890 asdf asdf asdf (123) 456-7890 asdf asdf asdf asdf asdf asdf (123) 456-7890 blah blah blah () blah";var regex = new RegExp(/^\(\d{3}\) \d{3}-\d{4}$/);function replace(loops) {    for (var i =0; i<loops; i++)         str.replace(regex,"(415) 832-5555");}timetest(replace, 1000, 100);