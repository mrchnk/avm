avm_test(ADD_RECURSE *.as
        ASC_ARGUMENTS -AS3 -optimize -config CONFIG::desktop=true
        AVM_ARGUMENTS ${REPORT_ABC}
        TARGET test_performance_jsbench
        LABELS performance jsbench)