avm_test(CONFIGURE_RECURSE float/*.as FLOAT)
avm_test(ADD_RECURSE *.as
        TARGET test_performance_FPBench
        LABELS performance FPBench
        ASC_ARGUMENTS -AS3 -optimize
        AVM_ARGUMENTS ${REPORT_ABC})