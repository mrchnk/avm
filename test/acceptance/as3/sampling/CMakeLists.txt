include(disable_tests)

avm_test(ADD *.as
        SHELL
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3
        TARGET test_as3_sampling
        LABELS acceptance as3 sampling)

disable_tests(test_acceptance_as3_sampling_Callback
        REASON https://github.com/mrchnk/avm/issues/3)