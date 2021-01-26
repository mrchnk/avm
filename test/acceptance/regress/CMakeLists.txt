avm_test(IGNORE patch_ByteArray_readFile.abc_)
avm_test(IGNORE printpassed.abc_)

avm_test(RECONFIGURE *.as ASC_ARGUMENTS -AS3 -optimize)
avm_test(RECONFIGURE vector_domain_bug.as ASC_ARGUMENTS -AS3 SHELL)
avm_test(CONFIGURE *.as INCLUDE ${TEST_ASC_INCLUDE} TARGET test_regress)

avm_test(CONFIGURE bug_515935.as WILL_FAIL)
avm_test(CONFIGURE bug_551587_2.as USES_SWF_VERSIONS)
avm_test(CONFIGURE bug_558863.as USES_SWF_VERSIONS)
avm_test(CONFIGURE bug_609416.as USES_SWF_VERSIONS)
avm_test(CONFIGURE bug_654807.as USES_SWF_VERSIONS)
avm_test(CONFIGURE bug_618215.as TEST_ARGUMENTS bug_618215_support/f-patched.abc_)
avm_test(CONFIGURE bug_520888.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1032")
avm_test(CONFIGURE bug_548684.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1053")
avm_test(CONFIGURE bug_555045.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1110")
avm_test(CONFIGURE bug_555048.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1033")
avm_test(CONFIGURE bug_555053.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1033")
avm_test(CONFIGURE bug_555097a.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1051")
avm_test(CONFIGURE bug_555097b.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1051")
avm_test(CONFIGURE bug_555097c.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1021")
avm_test(CONFIGURE bug_555102.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1107")
avm_test(CONFIGURE bug_555542.abc_ PASS_REGULAR_EXPRESSION "ReferenceError: Error #1065"
        AVM_ARGUMENTS patch_ByteArray_readFile.abc_
        TEST_ARGUMENTS printpassed.abc_)
avm_test(CONFIGURE bug_555568.abc_ PASS_REGULAR_EXPRESSION "PASSED!"
        AVM_ARGUMENTS patch_ByteArray_readFile.abc_
        TEST_ARGUMENTS printpassed.abc_)
avm_test(CONFIGURE bug_555612.abc_
        AVM_ARGUMENTS patch_ByteArray_readFile.abc_
        TEST_ARGUMENTS printpassed.abc_)
avm_test(CONFIGURE bug_555614.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1059")
avm_test(CONFIGURE bug_558442a.abc_ PASS_REGULAR_EXPRESSION -1)
avm_test(CONFIGURE bug_558442b.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1021")

avm_test(ADD *.as)
#avm_test(ADD *.abc_)

add_subdirectory(security)
add_dependencies(test_regress test_regress_security)
