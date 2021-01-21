add_custom_target(test_misc)

as3_set_arguments(bug_526662.as USES_SWF_VERSIONS)
as3_set_arguments(abstract-base-class.as SHELL)
as3_set_arguments(invalid_opcodes.as SHELL)
as3_set_arguments(catchableTimeout.as AVM_ARGUMENTS -Dtimeout)
as3_set_arguments(doubleTimeout.as AVM_ARGUMENTS -Dtimeout WILL_FAIL)
as3_set_arguments(testJitordieSwitch.as AVM_ARGUMENTS -Djitordie PASS_REGULAR_EXPRESSION "JIT failed")

as3_find_tests(test_misc ${CMAKE_CURRENT_LIST_DIR})
