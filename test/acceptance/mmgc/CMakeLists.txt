add_custom_target(test_mmgc)

as3_set_arguments(memlimit.as AVM_ARGUMENTS -memlimit 10240)
as3_set_arguments(memstats.as AVM_ARGUMENTS -memstats)
as3_set_arguments(outofmemory.as AVM_ARGUMENTS -memlimit 1024 WILL_FAIL)

as3_find_tests(test_mmgc ${CMAKE_CURRENT_LIST_DIR})
