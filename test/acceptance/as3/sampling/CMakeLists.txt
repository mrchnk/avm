avm_test(ADD *.as
        SHELL
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3
        TARGET test_as3_sampling
        LABELS acceptance as3 sampling)