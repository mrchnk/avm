avm_test(ADD *.as
        SHELL
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        TARGET test_as3_ByteArray
        LABELS acceptance as3 ByteArray)
