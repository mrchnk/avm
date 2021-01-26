avm_test(RECONFIGURE *.as
        ASC_ARGUMENTS -AS3 -optimize -import support/intrinsics.abc_
        AVM_ARGUMENTS support/intrinsics.abc_
        INCLUDE ${TEST_ASC_INCLUDE})

avm_test(ADD *.as TARGET test_mops)

avm_add_test(test_mops_mops mops.abc_ AVM_ARGUMENTS -Dnogc)
abcasm_add_target(test_mops_support support/intrinsics.abs "")
