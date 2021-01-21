as3_set_arguments(bugcompat.as TEST_ARGUMENTS bugcompat_support/bugcompat_leaf.abc bugcompat_support/bugcompat_test.abc)
as3_set_arguments(classes.as API_VERSIONS AIR_1_0 FP_10_0 AIR_1_5 AIR_1_5_1 FP_10_0_32 AIR_1_5_2)
as3_set_arguments(globals.as API_VERSIONS AIR_1_0 FP_10_0 AIR_1_5 AIR_1_5_1 FP_10_0_32 AIR_1_5_2)

as3_find_tests(test_versioning ${CMAKE_CURRENT_LIST_DIR})

add_custom_target(test_versioning_support
        COMMAND ${ASC} bugcompat_support/bugcompat_leaf.as
        COMMAND ${ASC} bugcompat_support/bugcompat_test.as
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

add_dependencies(test_versioning test_versioning_support)