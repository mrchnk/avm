include(disable_tests)

avm_test(ADD *.as
        SHELL
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3
        TARGET test_as3_Workers
        LABELS acceptance as3 Workers)

disable_tests(
        test_acceptance_as3_Workers_ByteArrayWorkers
        test_acceptance_as3_Workers_RemoteCall
        test_acceptance_as3_Workers_WorkerCreateMax
        REASON https://github.com/mrchnk/avm/issues/2)