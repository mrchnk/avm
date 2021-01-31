avm_test(ADD *.as
        ASC_ARGUMENTS -AS3 -optimize -import support/intrinsics.precompiled.abc
        AVM_ARGUMENTS support/intrinsics.precompiled.abc
        INCLUDE ${ASSERT_SRC}
        TARGET test_mops
        LABELS acceptance mops)

avm_add_test(test_mops_mops mops.precompiled.abc
        AVM_ARGUMENTS -Dnogc
        LABELS acceptance mops)
