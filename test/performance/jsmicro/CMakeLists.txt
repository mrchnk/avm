avm_test(IGNORE driver.as)
avm_test(ADD *.as
        ASC_ARGUMENTS -optimize
        AVM_ARGUMENTS ${REPORT_ABC}
        TARGET test_performance_jsmicro
        LABELS performance jsmicro)
