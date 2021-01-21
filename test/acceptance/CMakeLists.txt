add_custom_target(test_acceptance)
add_dependencies(test_acceptance avm)

set(AS3_INCLUDE ${CMAKE_CURRENT_LIST_DIR}/Assert.as ${CMAKE_CURRENT_LIST_DIR}/Utils.as)

if (CMAKE_GENERATOR MATCHES "Visual Studio")
    set(AS3_HASH_TARGET 1)
endif()

include(as3_add_test.cmake)
include(abs_add_test.cmake)
include(abc_add_test.cmake)
include(find_tests.cmake)

add_subdirectory(ecma3)
add_subdirectory(as3)
add_subdirectory(e4x)
add_subdirectory(misc)
add_subdirectory(mmgc)
add_subdirectory(mops)
add_subdirectory(recursion)
add_subdirectory(regress)
add_subdirectory(versioning)
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
        test_versioning
        test_abcasm
        test_spidermonkey)
