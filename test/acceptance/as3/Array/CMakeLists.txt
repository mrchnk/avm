avm_test(CONFIGURE regress_524122.as USES_SWF_VERSIONS)
avm_test(ADD *.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        TARGET test_as3_Array
        LABELS acceptance as3 Array)
