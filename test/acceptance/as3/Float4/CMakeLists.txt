avm_test(IGNORE floatUtil.as)

avm_test(RECONFIGURE_RECURSE *.as ASC_ARGUMENTS -AS3 -strict -optimize)
avm_test(RECONFIGURE_RECURSE nonstrict/*.as ASC_ARGUMENTS -AS3 -optimize)

avm_test(ADD_RECURSE *.as
        SHELL FLOAT
        INCLUDE ${ASSERT_SRC}
        TARGET test_as3_Float4
        LABELS acceptance as3 Float4)