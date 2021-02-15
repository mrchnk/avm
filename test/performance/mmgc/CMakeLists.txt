avm_test(ADD *.as
        ASC_ARGUMENTS -AS3 -optimize
        AVM_ARGUMENTS ${REPORT_ABC}
        TARGET test_performance_mmgc
        LABELS performance mmgc)