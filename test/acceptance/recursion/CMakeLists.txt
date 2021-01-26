avm_test(ADD *.as
        ASC_ARGUMENTS -AS3 -optimize
        INCLUDE ${TEST_ASC_INCLUDE}
        TARGET test_recursion)
