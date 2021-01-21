as3_set_arguments(*.as
        ASC_ARGUMENTS -AS3 -optimize -import support/intrinsics.abc_
        AVM_ARGUMENTS support/intrinsics.abc_)

add_test(NAME test_mops_mops
        COMMAND avm -Dnogc mops.abc_
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

add_custom_target(test_mops_support
        COMMAND ${ABCASM} -input support/intrinsics.abs -o support
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

as3_find_tests(test_mops ${CMAKE_CURRENT_LIST_DIR})
#add_dependencies(test_mops test_mops_support)