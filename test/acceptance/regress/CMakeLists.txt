avm_test(IGNORE patch_ByteArray_readFile.precompiled.abc)
avm_test(IGNORE printpassed.precompiled.abc)

avm_test(RECONFIGURE *.as ASC_ARGUMENTS -AS3 -optimize)
avm_test(RECONFIGURE vector_domain_bug.as ASC_ARGUMENTS -AS3 SHELL)
avm_test(RECONFIGURE bug_460872.as ASC_ARGUMENTS -AS3)

avm_test(CONFIGURE bug_515935.as WILL_FAIL)
avm_test(CONFIGURE bug_551587_2.as USES_SWF_VERSIONS)
avm_test(CONFIGURE bug_558863.as USES_SWF_VERSIONS)
avm_test(CONFIGURE bug_609416.as USES_SWF_VERSIONS)
avm_test(CONFIGURE bug_654807.as USES_SWF_VERSIONS)
avm_test(CONFIGURE bug_618215.as TEST_ARGUMENTS bug_618215_support/f-patched.precompiled.abc)
avm_test(CONFIGURE bug_520888.precompiled.abc PASS_REGULAR_EXPRESSION "VerifyError: Error #1032")
avm_test(CONFIGURE bug_548684.precompiled.abc PASS_REGULAR_EXPRESSION "VerifyError: Error #1053")
avm_test(CONFIGURE bug_555045.precompiled.abc PASS_REGULAR_EXPRESSION "VerifyError: Error #1110")
avm_test(CONFIGURE bug_555048.precompiled.abc PASS_REGULAR_EXPRESSION "VerifyError: Error #1033")
avm_test(CONFIGURE bug_555053.precompiled.abc PASS_REGULAR_EXPRESSION "VerifyError: Error #1033")
avm_test(CONFIGURE bug_555097a.precompiled.abc PASS_REGULAR_EXPRESSION "VerifyError: Error #1051")
avm_test(CONFIGURE bug_555097b.precompiled.abc PASS_REGULAR_EXPRESSION "VerifyError: Error #1051")
avm_test(CONFIGURE bug_555097c.precompiled.abc PASS_REGULAR_EXPRESSION "VerifyError: Error #1021")
avm_test(CONFIGURE bug_555102.precompiled.abc PASS_REGULAR_EXPRESSION "VerifyError: Error #1107")
avm_test(CONFIGURE bug_555542.precompiled.abc PASS_REGULAR_EXPRESSION "ReferenceError: Error #1065"
        AVM_ARGUMENTS patch_ByteArray_readFile.precompiled.abc
        TEST_ARGUMENTS printpassed.precompiled.abc)
avm_test(CONFIGURE bug_555568.precompiled.abc PASS_REGULAR_EXPRESSION "PASSED!"
        AVM_ARGUMENTS patch_ByteArray_readFile.precompiled.abc
        TEST_ARGUMENTS printpassed.precompiled.abc)
avm_test(CONFIGURE bug_555612.precompiled.abc
        AVM_ARGUMENTS patch_ByteArray_readFile.precompiled.abc
        TEST_ARGUMENTS printpassed.precompiled.abc)

avm_test(CONFIGURE bug_555614.precompiled.abc PASS_REGULAR_EXPRESSION "VerifyError: Error #1059")
avm_test(CONFIGURE bug_558442a.precompiled.abc PASS_REGULAR_EXPRESSION -1)
avm_test(CONFIGURE bug_558442b.precompiled.abc PASS_REGULAR_EXPRESSION "VerifyError: Error #1021")

avm_test(ADD *.as
        INCLUDE ${ASSERT_SRC}
        TARGET test_regress
        LABELS acceptance regress)

avm_test(ADD *.precompiled.abc
        LABELS acceptance regress)

add_subdirectory(security)
add_dependencies(test_regress test_regress_security)
