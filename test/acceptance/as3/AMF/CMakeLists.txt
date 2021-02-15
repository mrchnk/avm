avm_test(CONFIGURE AMFSerializer_float.as FLOAT)
avm_test(ADD *.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        TARGET test_as3_AMF
        LABELS acceptance as3 AMF)