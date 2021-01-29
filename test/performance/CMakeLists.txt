add_custom_target(test_performance)

set(report report-Default.as)
if (AVM_TEST_CDASH)
    set(report report-CDash.as)
endif()

asc_add_target(test_performance_support ${report} REPORT_ABC TARGET test_performance)
add_subdirectory(asmicro)
add_subdirectory(jsmicro)
add_subdirectory(jsbench)
add_subdirectory(FPBench)
add_subdirectory(language)

add_dependencies(test_performance
        test_performance_asmicro
        test_performance_jsmicro
        test_performance_jsbench
        test_performance_FPBench
        test_performance_language)