avm_test(IGNORE numberUtil.as)
avm_test(CONFIGURE e15_7_4_6_1.as USES_SWF_VERSIONS)
avm_test(CONFIGURE visibility.as USES_SWF_VERSIONS)

avm_test(ADD *.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        TARGET test_as3_Number
        LABELS acceptance as3 Number)