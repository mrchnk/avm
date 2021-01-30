add_custom_target(test_performance)

set(report report-Default.as)
if (AVM_TEST_CDASH)
    set(report report-CDash.as)
endif()

asc_add_target(test_performance_support ${report} REPORT_ABC TARGET test_performance)
add_subdirectory(asmicro)
add_subdirectory(jsmicro)
add_subdirectory(floating_point)
add_subdirectory(language)
add_subdirectory(misc)

add_dependencies(test_performance
        test_performance_asmicro
        test_performance_jsmicro
        test_performance_floating_point
        test_performance_language
        test_performance_misc)