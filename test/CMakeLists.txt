include(avm_test.cmake)

set(ASC ${ASC} -import ${BUILTIN_ABC} -import ${CMAKE_SOURCE_DIR}/generated/shell_toplevel.abc)

add_subdirectory(acceptance)
add_subdirectory(cmdline)
add_subdirectory(performance)
add_subdirectory(eval)

add_custom_target(test_all)
add_dependencies(test_all
        test_acceptance
        test_cmdline
        test_performance)