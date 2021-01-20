add_custom_target(test_abcasm)
add_custom_target(test_abs_helper
        COMMAND ${ASC} abs_helper.as
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

set(AS3_PREFIX test_abcasm)
set(AS3_BASEDIR ${CMAKE_CURRENT_LIST_DIR})
set(AS3_DEPENDS test_abs_helper)

set(AS3_HASH_TARGET 0)

as3_set_arguments(*.abs AVM_ARGUMENTS abs_helper.abc)
as3_set_arguments(coverage/float/*.abs FLOAT)
as3_set_arguments(float/*.abs FLOAT)
as3_set_arguments(bug_554915a.abs AVM_ARGUMENTS -Dtimeout abs_helper.abc WILL_FAIL)
as3_set_arguments(bug_554915b.abs AVM_ARGUMENTS -Dtimeout abs_helper.abc)
as3_set_arguments(bug_555006a.abs AVM_ARGUMENTS abs_helper.abc WILL_FAIL)
as3_set_arguments(bug_555006b.abs AVM_ARGUMENTS abs_helper.abc WILL_FAIL)
as3_set_arguments(bug_655118.abs AVM_ARGUMENTS abs_helper.abc WILL_FAIL)

# Disable tests that cannot be compiled with abcasm
as3_set_arguments(adhoc.abs DISABLED)
as3_set_arguments(bug_491056.abs DISABLED)
as3_set_arguments(bug_554915b.abs DISABLED)
as3_set_arguments(bug_612641.abs DISABLED)
as3_set_arguments(bug_678952.abs DISABLED)
as3_set_arguments(mops.abs DISABLED)
as3_set_arguments(mops2.abs DISABLED)
as3_set_arguments(namespaces.abs DISABLED)
as3_set_arguments(syntaxErrors.abs DISABLED)
as3_set_arguments(coverage/H.abs DISABLED)
as3_set_arguments(nullCheck/CallStatic.abs DISABLED)
as3_set_arguments(nullCheck/H.abs DISABLED)
as3_set_arguments(nullCheck/E.abs DISABLED)

abs_find_tests(test_abcasm ${CMAKE_CURRENT_LIST_DIR})
abs_find_tests(test_abcasm coverage)
abs_find_tests(test_abcasm coverage/float)
abs_find_tests(test_abcasm nullCheck)