set(API_VERSIONS AIR_1_0 FP_10_0 AIR_1_5 AIR_1_5_1 FP_10_0_32 AIR_1_5_2)

avm_test(CONFIGURE bugcompat.as
        TEST_ARGUMENTS
        bugcompat_support/bugcompat_leaf.abc
        bugcompat_support/bugcompat_test.abc)

avm_test(CONFIGURE classes.as API_VERSIONS ${API_VERSIONS})
avm_test(CONFIGURE globals.as API_VERSIONS ${API_VERSIONS})

add_custom_target(test_versioning_support
        COMMAND ${ASC} bugcompat_support/bugcompat_leaf.as
        COMMAND ${ASC} bugcompat_support/bugcompat_test.as
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

avm_test(ADD *.as
        ASC_ARGUMENTS -AS3 -optimize
        INCLUDE ${ASSERT_SRC}
        TARGET test_versioning
        LABELS acceptance versioning)

add_dependencies(test_versioning test_versioning_support)