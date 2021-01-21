as3_set_arguments(*.as ASC_ARGUMENTS -ES INCLUDE shell.as)

as3_add_arguments(js1_5/Function/regress-364023.as DISABLED) # uses eval
as3_add_arguments(js1_5/Regress/regress-159334.as DISABLED) # need to replicate without eval
as3_add_arguments(js1_5/GC/*.as DISABLED) # GC tests for spidermonkey
as3_add_arguments(js1_5/Regress/regress-58116.as DISABLED) # locale-specific test: https://bugzilla.mozilla.org/show_bug.cgi?id=564127
as3_add_arguments(js1_5/Regress/regress-104077.as DISABLED) # verifyerror: https://bugzilla.mozilla.org/show_bug.cgi?id=550512
as3_add_arguments(js1_5/Regress/regress-169559.as DISABLED) # need to investigate if global performance is really an issue
as3_add_arguments(js1_5/Regress/regress-174709.as DISABLED) # need to figure out what test is trying to do
as3_add_arguments(js1_5/Regress/regress-179524.as DISABLED) # needs investigation, may not have to port this one over
as3_add_arguments(js1_5/Regress/regress-191633.as DISABLED) # test builds very large string with comments and then evals it - may need to create huge file
as3_add_arguments(js1_5/Regress/regress-367561-01.as DISABLED) # need to build large test string
as3_add_arguments(js1_5/Regress/regress-367561-03.as DISABLED) # need to build large test string
as3_add_arguments(js1_5/Regress/regress-396684.as DISABLED) # need to build large test string
as3_add_arguments(js1_5/String/regress-179068.as DISABLED) # need to build large test string
as3_add_arguments(js1_5/Expressions/regress-394673.as DISABLED) # need to figure out a way to evaluate a long long chain of && ||
as3_add_arguments(js1_5/Regress/regress-290575.as DISABLED) # test evaluates function with 32768 arguments - need to convert to not use Function Body or eval
as3_add_arguments(js1_5/Regress/regress-211590.as DISABLED) # need to investigate how randoms are generated - i believe we only use 32 bit integers to gen
as3_add_arguments(js1_5/Regress/regress-303213.as DISABLED) # how do we handle out of memory errors?
as3_add_arguments(js1_5/Regress/regress-3649-n.as DISABLED) # out of memory
as3_add_arguments(js1_5/Regress/regress-312588.as DISABLED) # out of memory
as3_add_arguments(js1_5/Regress/regress-310993.as DISABLED) # how should e4x comments behave in as3?
as3_add_arguments(js1_5/Regress/regress-311071.as DISABLED) # how should e4x comments behave in as3?
as3_add_arguments(js1_5/Regress/regress-334807-*.as DISABLED) # need to investigate if this is a legit bug
as3_add_arguments(js1_5/Regress/regress-271716-n.as DISABLED) # takes too long to run - tries to crash by doing while (1) a=new Array(a) - possibly run in deep?
as3_add_arguments(js1_5/Regress/regress-98901.as DISABLED) # https://bugs.adobe.com/jira/browse/ASC-4041
as3_add_arguments(js1_5/Regress/regress-89443.as DISABLED) # https://bugs.adobe.com/jira/browse/ASC-4041
as3_add_arguments(js1_5/Regress/regress-96526-003.as DISABLED) # https://bugs.adobe.com/jira/browse/ASC-4041
as3_add_arguments(js1_5/Regress/regress-511859.as DISABLED) # https://bugzilla.mozilla.org/show_bug.cgi?id=611531
as3_add_arguments(js1_6/Array/regress-304828.as DISABLED) # Array methods on String not supported
as3_add_arguments(js1_6/Array/regress-386030.as DISABLED) # https://bugs.adobe.com/jira/browse/ASL-55
as3_add_arguments(js1_6/extensions/regress-312385-01.as DISABLED) # uses eval

as3_ignore(js1_5/Regress/regress-31255.as) # how should e4x comments behave in as3?, excluding since it will not compile
as3_ignore(js1_5/Regress/regress-352009.as) # should array comprehension work?, excluding since it will not compile
as3_ignore(js1_5/Regress/regress-191668.as) # should (0 <!-0) be legal? , excluding since it will not compile

as3_find_tests(test_spidermonkey js1_1/*)
as3_find_tests(test_spidermonkey js1_2/*)
as3_find_tests(test_spidermonkey js1_3/*)
as3_find_tests(test_spidermonkey js1_4/*)
as3_find_tests(test_spidermonkey js1_5/*)
as3_find_tests(test_spidermonkey js1_6/*)
