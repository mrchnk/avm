avm_test(RECONFIGURE *.as
        ASC_ARGUMENTS -AS3 -optimize
        INCLUDE ${TEST_ASC_INCLUDE}
        TARGET test_regress_security)


avm_test(CONFIGURE bug567284.as
        TEST_ARGUMENTS bug567284_support/
        SHELL)
avm_test(CONFIGURE bug_441280.as
        SHELL)
avm_test(CONFIGURE bug_555059a.abc_
        PASS_REGULAR_EXPRESSION "VerifyError: Error #1032"
        AVM_ARGUMENTS ../patch_ByteArray_readFile.abc_
        TEST_ARGUMENTS ../printpassed.abc_)
avm_test(CONFIGURE bug_555059b.abc_
        PASS_REGULAR_EXPRESSION "VerifyError: Error #1032"
        AVM_ARGUMENTS ../patch_ByteArray_readFile.abc_
        TEST_ARGUMENTS ../printpassed.abc_)
avm_test(CONFIGURE bug_556543.abc_
        PASS_REGULAR_EXPRESSION "VerifyError: Error #1107")

avm_test(ADD *.as)
#avm_test(ADD *.abc_)

add_custom_target(test_regress_security_support
        COMMAND ${ASC} bug567284_support/Dup1.as
        COMMAND ${ASC} bug567284_support/Dup2.as
        COMMAND ${ASC} bug567284_support/DupExaminer.as
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

add_dependencies(test_regress_security test_regress_security_support)