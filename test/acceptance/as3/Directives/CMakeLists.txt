avm_test(ADD */*.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        TARGET test_as3_Directives
        LABELS acceptance as3 Directives)
