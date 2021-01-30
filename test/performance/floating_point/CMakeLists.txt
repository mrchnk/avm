avm_test(CONFIGURE_RECURSE float/*.as FLOAT)
avm_test(ADD_RECURSE *.as
        TARGET test_performance_floating_point
        LABELS performance floating_point
        ASC_ARGUMENTS -AS3 -optimize
        AVM_ARGUMENTS ${REPORT_ABC})