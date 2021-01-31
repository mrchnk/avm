add_custom_target(test_acceptance)

if (CMAKE_GENERATOR MATCHES "Visual Studio")
    # Visual Studio has restrictions on file path length
    # It's easy to fall in that restrictions with target names
    # based on test path
    set(AVM_TEST_HASH_TARGET 1)
endif()

set(TEST_ASC_INCLUDE ${CMAKE_CURRENT_LIST_DIR}/Assert.as ${CMAKE_CURRENT_LIST_DIR}/Utils.as)

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
add_subdirectory(asc)
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
        test_asc
        test_spidermonkey)
