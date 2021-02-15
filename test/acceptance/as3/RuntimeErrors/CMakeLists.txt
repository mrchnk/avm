avm_test(CONFIGURE Error1115NotAConstructor.as USES_SWF_VERSIONS)
avm_test(ADD *.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        TARGET test_as3_RuntimeErrors
        LABELS acceptance as3 RuntimeErrors)