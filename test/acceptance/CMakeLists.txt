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
include(find_tests.cmake)

as3_set_arguments(misc/bug_526662.as USES_SWF_VERSIONS)
as3_set_arguments(misc/abstract-base-class.as SHELL)
as3_set_arguments(misc/invalid_opcodes.as SHELL)
as3_set_arguments(misc/catchableTimeout.as AVM_ARGUMENTS -Dtimeout)
as3_set_arguments(misc/doubleTimeout.as AVM_ARGUMENTS -Dtimeout WILL_FAIL)
as3_set_arguments(misc/testJitordieSwitch.as AVM_ARGUMENTS -Djitordie PASS_REGULAR_EXPRESSION "JIT failed")
as3_set_arguments(mmgc/memlimit.as AVM_ARGUMENTS -memlimit 10240)
as3_set_arguments(mmgc/memstats.as AVM_ARGUMENTS -memstat)
as3_set_arguments(mmgc/outofmemory.as AVM_ARGUMENTS -memlimit 1024 WILL_FAIL)
as3_set_arguments(mops/*.as ASC_ARGUMENTS -AS3 -optimize -import generated/intrinsics.abc_ AVM_ARGUMENTS generated/intrinsics.abc_)
as3_set_arguments(regress/bug_515935.as WILL_FAIL)
as3_set_arguments(regress/security/bug567284.as TEST_ARGUMENTS regress/security/bug567284_support/ SHELL)
as3_set_arguments(regress/security/bug_441280.as SHELL)
as3_set_arguments(regress/vector_domain_bug.as ASC_ARGUMENTS -AS3 SHELL)
as3_set_arguments(regress/bug_551587_2.as USES_SWF_VERSIONS)
as3_set_arguments(regress/bug_558863.as USES_SWF_VERSIONS)
as3_set_arguments(regress/bug_609416.as USES_SWF_VERSIONS)
as3_set_arguments(regress/bug_654807.as USES_SWF_VERSIONS)
as3_set_arguments(regress/bug_618215.as TEST_ARGUMENTS regress/bug_618215_support/f-patched.abc_)
as3_set_arguments(versioning/bugcompat.as TEST_ARGUMENTS versioning/bugcompat_support/bugcompat_leaf.abc versioning/bugcompat_support/bugcompat_test.abc)
as3_set_arguments(versioning/classes.as API_VERSIONS AIR_1_0 FP_10_0 AIR_1_5 AIR_1_5_1 FP_10_0_32 AIR_1_5_2)
as3_set_arguments(versioning/globals.as API_VERSIONS AIR_1_0 FP_10_0 AIR_1_5 AIR_1_5_1 FP_10_0_32 AIR_1_5_2)

as3_find_tests(test_misc misc)
as3_find_tests(test_mmgc mmgc)
as3_find_tests(test_mops mops)
as3_find_tests(test_recursion recursion)
as3_find_tests(test_regress regress)
as3_find_tests(test_regress regress/security)
as3_find_tests(test_versioning versioning)

add_subdirectory(as3)
add_subdirectory(e4x)
add_subdirectory(ecma3)
add_subdirectory(abcasm)
add_subdirectory(spidermonkey)

add_dependencies(test_acceptance
        test_as3
        test_e4x
        test_ecma3
        test_abcasm
        test_spidermonkey)
