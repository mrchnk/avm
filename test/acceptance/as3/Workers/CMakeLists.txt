avm_test(ADD *.as
        SHELL
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3
        TARGET test_as3_Workers
        LABELS acceptance as3 Workers)