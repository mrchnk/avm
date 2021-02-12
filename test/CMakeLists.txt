include(avm_test)

set(ASC ${ASC} -import ${BUILTIN_ABC} -import ${SHELL_ABC})

add_subdirectory(acceptance)
add_subdirectory(cmdline)
add_subdirectory(performance)
add_subdirectory(eval)

add_custom_target(test_abc)
add_dependencies(test_abc
        test_acceptance
        test_cmdline
        test_performance)