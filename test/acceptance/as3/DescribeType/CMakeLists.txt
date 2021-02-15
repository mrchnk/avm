avm_test(ADD *.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize -md
        TARGET test_as3_DescribeType
        LABELS acceptance as3 DescribeType)
