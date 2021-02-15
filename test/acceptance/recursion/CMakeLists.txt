avm_test(ADD *.as
        ASC_ARGUMENTS -AS3 -optimize
        INCLUDE ${ASSERT_SRC}
        TARGET test_recursion
        LABELS acceptance recursion)
