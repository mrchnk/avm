avm_test(ADD *.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        TARGET test_as3_Math
        LABELS acceptance as3 Math)