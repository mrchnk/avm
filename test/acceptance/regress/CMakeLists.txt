as3_ignore(patch_ByteArray_readFile.abc_)
as3_ignore(printpassed.abc_)

as3_set_arguments(bug_515935.as WILL_FAIL)
as3_set_arguments(vector_domain_bug.as ASC_ARGUMENTS -AS3 SHELL)
as3_set_arguments(bug_551587_2.as USES_SWF_VERSIONS)
as3_set_arguments(bug_558863.as USES_SWF_VERSIONS)
as3_set_arguments(bug_609416.as USES_SWF_VERSIONS)
as3_set_arguments(bug_654807.as USES_SWF_VERSIONS)
as3_set_arguments(bug_618215.as TEST_ARGUMENTS bug_618215_support/f-patched.abc_)
as3_set_arguments(bug_520888.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1032")
as3_set_arguments(bug_548684.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1053")
as3_set_arguments(bug_555045.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1110")
as3_set_arguments(bug_555048.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1033")
as3_set_arguments(bug_555053.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1033")
as3_set_arguments(bug_555097a.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1051")
as3_set_arguments(bug_555097b.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1051")
as3_set_arguments(bug_555097c.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1021")
as3_set_arguments(bug_555102.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1107")
as3_set_arguments(bug_555542.abc_ PASS_REGULAR_EXPRESSION "ReferenceError: Error #1065"
        AVM_ARGUMENTS patch_ByteArray_readFile.abc_
        TEST_ARGUMENTS printpassed.abc_)
as3_set_arguments(bug_555568.abc_ PASS_REGULAR_EXPRESSION "PASSED!"
        AVM_ARGUMENTS patch_ByteArray_readFile.abc_
        TEST_ARGUMENTS printpassed.abc_)
as3_set_arguments(bug_555612.abc_
        AVM_ARGUMENTS patch_ByteArray_readFile.abc_
        TEST_ARGUMENTS printpassed.abc_)
as3_set_arguments(bug_555614.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1059")
as3_set_arguments(bug_558442a.abc_ PASS_REGULAR_EXPRESSION -1)
as3_set_arguments(bug_558442b.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1021")

as3_find_tests(test_regress ${CMAKE_CURRENT_LIST_DIR})
abc_find_tests(test_regress ${CMAKE_CURRENT_LIST_DIR})

add_subdirectory(security)
add_dependencies(test_regress test_regress_security)
