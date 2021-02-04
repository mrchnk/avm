avm_test(CONFIGURE logicalAssignment2.as SHELL)
avm_test(ADD *.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        LABELS acceptance as3 Expressions)

avm_test(ADD */*.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        LABELS acceptance as3 Expressions)

avm_test_target(test_as3_Expressions)