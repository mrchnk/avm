avm_test(IGNORE legacyFunctions.as)
avm_test(IGNORE floatUtil.as)
avm_test(IGNORE includes/floatUtil.as)

avm_test(RECONFIGURE_RECURSE *.as ASC_ARGUMENTS -AS3 -strict -optimize)
avm_test(RECONFIGURE_RECURSE nonstrict/*.as ASC_ARGUMENTS -AS3 -optimize)
avm_test(CONFIGURE loadLegacyCode.as SHELL TEST_ARGUMENTS legacyFunctions.precompiled.abc)

avm_test(ADD_RECURSE *.as
        SHELL FLOAT
        INCLUDE ${ASSERT_SRC}
        TARGET test_as3_Float
        LABELS acceptance as3 Float)