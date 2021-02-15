cmdline_test(selftest_mmfx_new_array_opts_canFail
        AVM_ARGUMENTS -Dselftest=mmgc,mmfx_array,mmfx_new_array_opts_canFail -memlimit 1024
        PASS_REGULAR_EXPRESSION
        "\\['start', 'mmgc', 'mmfx_array'\\]"
        "\\['test', 'mmgc', 'mmfx_array', 'mmfx_new_array_opts_canFail'\\]"
        "\\['pass', 'mmgc', 'mmfx_array', 'mmfx_new_array_opts_canFail'\\]"
        "\\['end', 'mmgc', 'mmfx_array'\\]")

cmdline_test(selftest_mmfx_new_array_opts_oom
        AVM_ARGUMENTS -Dselftest=mmgc,mmfx_array,mmfx_new_array_opts_oom -memlimit 1024
        PASS_RETURN_CODE 128)

cmdline_test(selftest_mmfx_new_array_oom
        AVM_ARGUMENTS -Dselftest=mmgc,mmfx_array,mmfx_new_array_oom -memlimit 1024
        PASS_RETURN_CODE 128)

cmdline_test(selftest_VMbaseConcurrency
        AVM_ARGUMENTS -Dselftest=vmbase,concurrency
        PASS_REGULAR_EXPRESSION
        "\\['start', 'vmbase', 'concurrency'\\]"
        "\\['test', 'vmbase', 'concurrency', 'mutexes'\\]"
        "\\['pass', 'vmbase', 'concurrency', 'mutexes'\\]"
        "\\['test', 'vmbase', 'concurrency', 'conditions'\\]"
        "\\['pass', 'vmbase', 'concurrency', 'conditions'\\]"
        "\\['test', 'vmbase', 'concurrency', 'atomic_counter'\\]"
        "\\['pass', 'vmbase', 'concurrency', 'atomic_counter'\\]"
        "\\['test', 'vmbase', 'concurrency', 'compare_and_swap_without_barrier'\\]"
        "\\['pass', 'vmbase', 'concurrency', 'compare_and_swap_without_barrier'\\]"
        "\\['test', 'vmbase', 'concurrency', 'compare_and_swap_with_barrier'\\]"
        "\\['pass', 'vmbase', 'concurrency', 'compare_and_swap_with_barrier'\\]"
        "\\['test', 'vmbase', 'concurrency', 'memory_barrier'\\]"
        "\\['pass', 'vmbase', 'concurrency', 'memory_barrier'\\]"
        "\\['test', 'vmbase', 'concurrency', 'condition_with_wait'\\]"
        "\\['pass', 'vmbase', 'concurrency', 'condition_with_wait'\\]"
        "\\['test', 'vmbase', 'concurrency', 'sleep'\\]"
        "\\['pass', 'vmbase', 'concurrency', 'sleep'\\]"
        "\\['test', 'vmbase', 'concurrency', 'vmthreadlocal'\\]"
        "\\['pass', 'vmbase', 'concurrency', 'vmthreadlocal'\\]"
        "\\['test', 'vmbase', 'concurrency', 'join'\\]"
        "\\['pass', 'vmbase', 'concurrency', 'join'\\]"
        "\\['end', 'vmbase', 'concurrency'\\]")


cmdline_test(selftest_VMbaseSafepoints
        AVM_ARGUMENTS -Dselftest=vmbase,safepoints
        PASS_REGULAR_EXPRESSION
        "\\['start', 'vmbase', 'safepoints'\\]"
        "\\['test', 'vmbase', 'safepoints', 'simple'\\]"
        "\\['pass', 'vmbase', 'safepoints', 'simple'\\]"
        "\\['test', 'vmbase', 'safepoints', 'producer_consumer'\\]"
        "\\['pass', 'vmbase', 'safepoints', 'producer_consumer'\\]"
        "\\['test', 'vmbase', 'safepoints', 'nested_producer_consumer'\\]"
        "\\['pass', 'vmbase', 'safepoints', 'nested_producer_consumer'\\]"
        "\\['end', 'vmbase', 'safepoints'\\]"
        DISABLED) # https://bugzilla.mozilla.org/show_bug.cgi?id=754918

cmdline_test(selftest_VMPIThreads
        AVM_ARGUMENTS -Dselftest=vmpi,threads
        PASS_REGULAR_EXPRESSION
        "\\['start', 'vmpi', 'threads'\\]"
        "\\['test', 'vmpi', 'threads', 'mutexes'\\]"
        "\\['pass', 'vmpi', 'threads', 'mutexes'\\]"
        "\\['test', 'vmpi', 'threads', 'conditions'\\]"
        "\\['pass', 'vmpi', 'threads', 'conditions'\\]"
        "\\['test', 'vmpi', 'threads', 'atomic_increment_without_barrier'\\]"
        "\\['pass', 'vmpi', 'threads', 'atomic_increment_without_barrier'\\]"
        "\\['test', 'vmpi', 'threads', 'atomic_decrement_without_barrier'\\]"
        "\\['pass', 'vmpi', 'threads', 'atomic_decrement_without_barrier'\\]"
        "\\['test', 'vmpi', 'threads', 'compare_and_swap_without_barrier'\\]"
        "\\['pass', 'vmpi', 'threads', 'compare_and_swap_without_barrier'\\]"
        "\\['test', 'vmpi', 'threads', 'atomic_increment_with_barrier'\\]"
        "\\['pass', 'vmpi', 'threads', 'atomic_increment_with_barrier'\\]"
        "\\['test', 'vmpi', 'threads', 'atomic_decrement_with_barrier'\\]"
        "\\['pass', 'vmpi', 'threads', 'atomic_decrement_with_barrier'\\]"
        "\\['test', 'vmpi', 'threads', 'compare_and_swap_with_barrier'\\]"
        "\\['pass', 'vmpi', 'threads', 'compare_and_swap_with_barrier'\\]"
        "\\['test', 'vmpi', 'threads', 'memory_barrier'\\]"
        "\\['pass', 'vmpi', 'threads', 'memory_barrier'\\]"
        "\\['test', 'vmpi', 'threads', 'try_lock'\\]"
        "\\['pass', 'vmpi', 'threads', 'try_lock'\\]"
        "\\['test', 'vmpi', 'threads', 'condition_with_wait'\\]"
        "\\['pass', 'vmpi', 'threads', 'condition_with_wait'\\]"
        "\\['test', 'vmpi', 'threads', 'sleep'\\]"
        "\\['pass', 'vmpi', 'threads', 'sleep'\\]"
        "\\['test', 'vmpi', 'threads', 'detach'\\]"
        "\\['pass', 'vmpi', 'threads', 'detach'\\]"
        "\\['test', 'vmpi', 'threads', 'thread_attributes'\\]"
        "\\['pass', 'vmpi', 'threads', 'thread_attributes'\\]"
        "\\['end', 'vmpi', 'threads'\\]")