avm_test(CONFIGURE js1_5/Function/regress-364023.as DISABLED) # uses eval
avm_test(CONFIGURE js1_5/Regress/regress-159334.as DISABLED) # need to replicate without eval
avm_test(CONFIGURE js1_5/GC/*.as DISABLED) # GC tests for spidermonkey
avm_test(CONFIGURE js1_5/Regress/regress-58116.as DISABLED) # locale-specific test: https://bugzilla.mozilla.org/show_bug.cgi?id=564127
avm_test(CONFIGURE js1_5/Regress/regress-104077.as DISABLED) # verifyerror: https://bugzilla.mozilla.org/show_bug.cgi?id=550512
avm_test(CONFIGURE js1_5/Regress/regress-169559.as DISABLED) # need to investigate if global performance is really an issue
avm_test(CONFIGURE js1_5/Regress/regress-174709.as DISABLED) # need to figure out what test is trying to do
avm_test(CONFIGURE js1_5/Regress/regress-179524.as DISABLED) # needs investigation, may not have to port this one over
avm_test(CONFIGURE js1_5/Regress/regress-191633.as DISABLED) # test builds very large string with comments and then evals it - may need to create huge file
avm_test(CONFIGURE js1_5/Regress/regress-367561-01.as DISABLED) # need to build large test string
avm_test(CONFIGURE js1_5/Regress/regress-367561-03.as DISABLED) # need to build large test string
avm_test(CONFIGURE js1_5/Regress/regress-396684.as DISABLED) # need to build large test string
avm_test(CONFIGURE js1_5/String/regress-179068.as DISABLED) # need to build large test string
avm_test(CONFIGURE js1_5/Expressions/regress-394673.as DISABLED) # need to figure out a way to evaluate a long long chain of && ||
avm_test(CONFIGURE js1_5/Regress/regress-290575.as DISABLED) # test evaluates function with 32768 arguments - need to convert to not use Function Body or eval
avm_test(CONFIGURE js1_5/Regress/regress-211590.as DISABLED) # need to investigate how randoms are generated - i believe we only use 32 bit integers to gen
avm_test(CONFIGURE js1_5/Regress/regress-303213.as DISABLED) # how do we handle out of memory errors?
avm_test(CONFIGURE js1_5/Regress/regress-3649-n.as DISABLED) # out of memory
avm_test(CONFIGURE js1_5/Regress/regress-312588.as DISABLED) # out of memory
avm_test(CONFIGURE js1_5/Regress/regress-310993.as DISABLED) # how should e4x comments behave in as3?
avm_test(CONFIGURE js1_5/Regress/regress-311071.as DISABLED) # how should e4x comments behave in as3?
avm_test(CONFIGURE js1_5/Regress/regress-334807-*.as DISABLED) # need to investigate if this is a legit bug
avm_test(CONFIGURE js1_5/Regress/regress-271716-n.as DISABLED) # takes too long to run - tries to crash by doing while (1) a=new Array(a) - possibly run in deep?
avm_test(CONFIGURE js1_5/Regress/regress-98901.as DISABLED) # https://bugs.adobe.com/jira/browse/ASC-4041
avm_test(CONFIGURE js1_5/Regress/regress-89443.as DISABLED) # https://bugs.adobe.com/jira/browse/ASC-4041
avm_test(CONFIGURE js1_5/Regress/regress-96526-003.as DISABLED) # https://bugs.adobe.com/jira/browse/ASC-4041
avm_test(CONFIGURE js1_5/Regress/regress-511859.as DISABLED) # https://bugzilla.mozilla.org/show_bug.cgi?id=611531
avm_test(CONFIGURE js1_6/Array/regress-304828.as DISABLED) # Array methods on String not supported
avm_test(CONFIGURE js1_6/Array/regress-386030.as DISABLED) # https://bugs.adobe.com/jira/browse/ASL-55
avm_test(CONFIGURE js1_6/extensions/regress-312385-01.as DISABLED) # uses eval
avm_test(CONFIGURE js1_5/Regress/regress-31255.as DISABLED) # how should e4x comments behave in as3?, excluding since it will not compile
avm_test(CONFIGURE js1_5/Regress/regress-352009.as DISABLED) # should array comprehension work?, excluding since it will not compile
avm_test(CONFIGURE js1_5/Regress/regress-191668.as DISABLED) # should (0 <!-0) be legal? , excluding since it will not compile

avm_test(IGNORE shell.as)

avm_test(ADD_RECURSE *.as
        ASC_ARGUMENTS -ES
        INCLUDE ${ASSERT_SRC} shell.as
        TARGET test_spidermonkey
        LABELS acceptance spidermonkey)
