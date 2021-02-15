avm_test(CONFIGURE localeCompare_585791.as USES_SWF_VERSIONS)
avm_test(ADD *.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        TARGET test_as3_String
        LABELS acceptance as3 String)