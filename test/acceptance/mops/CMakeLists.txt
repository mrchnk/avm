add_custom_target(test_mops)

as3_set_arguments(*.as
        ASC_ARGUMENTS -AS3 -optimize -import generated/intrinsics.abc_
        AVM_ARGUMENTS generated/intrinsics.abc_)

add_test(NAME test_mops_mops
        COMMAND avm -Dnogc mops.abc_
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

as3_find_tests(test_mops ${CMAKE_CURRENT_LIST_DIR})