set(AS3_BASEDIR ${CMAKE_CURRENT_LIST_DIR})

as3_set_arguments(bug567284.as TEST_ARGUMENTS bug567284_support/ SHELL)
as3_set_arguments(bug_441280.as SHELL)
as3_set_arguments(bug_555059a.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1032"
        AVM_ARGUMENTS ../patch_ByteArray_readFile.abc_
        TEST_ARGUMENTS ../printpassed.abc_)
as3_set_arguments(bug_555059b.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1032"
        AVM_ARGUMENTS ../patch_ByteArray_readFile.abc_
        TEST_ARGUMENTS ../printpassed.abc_)
as3_set_arguments(bug_556543.abc_ PASS_REGULAR_EXPRESSION "VerifyError: Error #1107")

as3_find_tests(test_regress_security ${CMAKE_CURRENT_LIST_DIR})
abc_find_tests(test_regress_security ${CMAKE_CURRENT_LIST_DIR})

add_custom_target(test_regress_security_support
        COMMAND ${ASC} bug567284_support/Dup1.as
        COMMAND ${ASC} bug567284_support/Dup2.as
        COMMAND ${ASC} bug567284_support/DupExaminer.as
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

add_dependencies(test_regress_security test_regress_security_support)