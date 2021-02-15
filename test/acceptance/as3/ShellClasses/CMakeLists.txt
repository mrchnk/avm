avm_test(ADD *.as
        SHELL
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3
        TARGET test_as3_ShellClasses
        LABELS acceptance as3 ShellClasses)