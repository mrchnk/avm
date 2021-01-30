avm_test(IGNORE driver.as)

asc_add_target(test_performance_abcasm-driver abcasm-driver.as ABCASM_DRIVER)

avm_test(ADD *.as
        ASC_ARGUMENTS -AS3 -optimize -config CONFIG::desktop=true
        AVM_ARGUMENTS ${REPORT_ABC}
        TARGET test_performance_misc
        LABELS performance misc)

avm_test(ADD *.abs
        AVM_ARGUMENTS ${REPORT_ABC} ${ABCASM_DRIVER}
        TARGET test_performance_misc
        LABELS performance misc)

add_dependencies(test_performance_misc test_performance_abcasm-driver)