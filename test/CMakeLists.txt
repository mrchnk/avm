include(avm_test.cmake)

add_subdirectory(acceptance)
add_subdirectory(cmdline)
add_subdirectory(performance)
add_subdirectory(eval)

add_custom_target(test_all)
add_dependencies(test_all
        test_acceptance
        test_cmdline
        test_performance)