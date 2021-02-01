avm_test(CONFIGURE memlimit.as AVM_ARGUMENTS -memlimit 10240)
avm_test(CONFIGURE memstats.as AVM_ARGUMENTS -memstats)
avm_test(CONFIGURE outofmemory.as AVM_ARGUMENTS -memlimit 1024 WILL_FAIL)

avm_test(ADD *.as
        NORMAL_JIT_INTERP
        ASC_ARGUMENTS -AS3 -optimize
        INCLUDE ${ASSERT_SRC}
        TARGET test_mmgc
        LABELS acceptance mmgc)
