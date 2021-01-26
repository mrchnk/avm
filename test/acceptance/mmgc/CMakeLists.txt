avm_test(RECONFIGURE *.as
        ASC_ARGUMENTS -AS3 -optimize
        INCLUDE ${TEST_ASC_INCLUDE}
        TARGET test_mmgc)

avm_test(CONFIGURE memlimit.as AVM_ARGUMENTS -memlimit 10240)
avm_test(CONFIGURE memstats.as AVM_ARGUMENTS -memstats)
avm_test(CONFIGURE outofmemory.as AVM_ARGUMENTS -memlimit 1024 WILL_FAIL)

avm_test(ADD *.as)
