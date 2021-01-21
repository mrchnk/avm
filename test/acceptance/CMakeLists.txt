add_custom_target(test_acceptance)
add_dependencies(test_acceptance avm)

set(AS3_PREFIX test)
set(AS3_BASEDIR ${CMAKE_CURRENT_LIST_DIR})
set(AS3_INCLUDE ${CMAKE_CURRENT_LIST_DIR}/Assert.as ${CMAKE_CURRENT_LIST_DIR}/Utils.as)
set(AS3_TARGET test_acceptance)

if (CMAKE_GENERATOR MATCHES "Visual Studio")
    set(AS3_HASH_TARGET 1)
endif()

include(as3_add_test.cmake)
include(abs_add_test.cmake)
include(abc_add_test.cmake)
include(find_tests.cmake)

as3_set_arguments(versioning/bugcompat.as TEST_ARGUMENTS versioning/bugcompat_support/bugcompat_leaf.abc versioning/bugcompat_support/bugcompat_test.abc)
as3_set_arguments(versioning/classes.as API_VERSIONS AIR_1_0 FP_10_0 AIR_1_5 AIR_1_5_1 FP_10_0_32 AIR_1_5_2)
as3_set_arguments(versioning/globals.as API_VERSIONS AIR_1_0 FP_10_0 AIR_1_5 AIR_1_5_1 FP_10_0_32 AIR_1_5_2)

as3_find_tests(test_versioning versioning)

add_subdirectory(ecma3)
add_subdirectory(as3)
add_subdirectory(e4x)
add_subdirectory(misc)
add_subdirectory(mmgc)
add_subdirectory(mops)
add_subdirectory(recursion)
add_subdirectory(regress)
add_subdirectory(abcasm)
add_subdirectory(spidermonkey)

add_dependencies(test_acceptance
        test_ecma3
        test_as3
        test_e4x
        test_misc
        test_mmgc
        test_mops
        test_recursion
        test_regress
        test_abcasm
        test_spidermonkey)
