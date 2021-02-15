avm_test(CONFIGURE bug567284.as SHELL
        TEST_ARGUMENTS bug567284_support/)

avm_test(CONFIGURE bug_441280.as SHELL)

avm_test(CONFIGURE bug_555059a.precompiled.abc
        PASS_REGULAR_EXPRESSION "VerifyError: Error #1032"
        AVM_ARGUMENTS ../patch_ByteArray_readFile.precompiled.abc
        TEST_ARGUMENTS ../printpassed.precompiled.abc)

avm_test(CONFIGURE bug_555059b.precompiled.abc
        PASS_REGULAR_EXPRESSION "VerifyError: Error #1032"
        AVM_ARGUMENTS ../patch_ByteArray_readFile.precompiled.abc
        TEST_ARGUMENTS ../printpassed.precompiled.abc)

avm_test(CONFIGURE bug_556543.precompiled.abc
        PASS_REGULAR_EXPRESSION "VerifyError: Error #1107")

avm_test(ADD *.as
        ASC_ARGUMENTS -AS3 -optimize
        INCLUDE ${ASSERT_SRC}
        TARGET test_regress_security
        LABELS acceptance regress security)

avm_test(ADD *.precompiled.abc
        LABELS acceptance regress security)

add_custom_target(test_regress_security_support
        COMMAND ${ASC} bug567284_support/Dup1.as
        COMMAND ${ASC} bug567284_support/Dup2.as
        COMMAND ${ASC} bug567284_support/DupExaminer.as
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

add_dependencies(test_regress_security test_regress_security_support)