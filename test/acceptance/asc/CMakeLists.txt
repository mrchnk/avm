avm_test(CONFIGURE compare-with-inference.as FLOAT)
avm_test(CONFIGURE undefined-as-default-value.as FLOAT)
avm_test(CONFIGURE *float*.as FLOAT)

avm_test(IGNORE import-with-float4-helper.as)
avm_test(CONFIGURE import-with-float4-main.as
        ASC_ARGUMENTS -import import-with-float4-helper.precompiled.abc
        AVM_ARGUMENTS import-with-float4-helper.precompiled.abc)

avm_test(ADD *.as
        ACS_ARGUMENTS -AS3 -strict -optimize
        INCLUDE ${ASSERT_SRC}
        TARGET test_asc
        LABELS acceptance asc)
