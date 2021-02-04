avm_test(IGNORE driver.as)
avm_test(IGNORE abcasm-driver.as)

asc_add_target(test_performance_misc_abcasm-driver abcasm-driver.as ABCASM_DRIVER)

avm_test(ADD *.as
        ASC_ARGUMENTS -AS3 -optimize -config CONFIG::desktop=true
        AVM_ARGUMENTS ${REPORT_ABC}
        LABELS performance misc)

avm_test(ADD *.abs
        AVM_ARGUMENTS ${REPORT_ABC} ${ABCASM_DRIVER}
        LABELS performance misc)

avm_test_target(test_performance_misc)
add_dependencies(test_performance_misc test_performance_misc_abcasm-driver)
