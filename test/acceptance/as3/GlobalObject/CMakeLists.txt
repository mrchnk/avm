avm_test(CONFIGURE parseFloat_513018.as USES_SWF_ARGUMENTS)
avm_test(ADD *.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        TARGET test_as3_GlobalObject
        LABELS acceptance as3 GlobalObject)