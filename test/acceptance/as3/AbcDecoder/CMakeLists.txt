avm_test(ADD *.as
        NORMAL_JIT_INTERP
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        TARGET test_as3_AbcDecoder
        LABELS acceptance as3 AbcDecoder)