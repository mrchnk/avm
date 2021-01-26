set(commands "")
file(GLOB sources ${CMAKE_CURRENT_LIST_DIR}/testdata/*.as)
foreach (src ${sources})
    file(RELATIVE_PATH src ${CMAKE_CURRENT_LIST_DIR} ${src})
    list(APPEND commands COMMAND ${ASC} -d ${src})
endforeach ()

add_custom_target(test_cmdline_data
        ${commands}
        SOURCES ${sources}
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

add_custom_target(test_cmdline)
add_dependencies(test_cmdline
        test_cmdline_data)

function(cmdline_add_test name)
    cmake_parse_arguments(arg "DISABLED" "PASS_RETURN_CODE" "AVM_ARGUMENTS;INPUT;PASS_REGULAR_EXPRESSION" ${ARGN})
    add_test(NAME test_cmdline_${name}
            COMMAND ${CMAKE_COMMAND}
            -DNAME=${name}
            -DPASS_RETURN_CODE=${arg_PASS_RETURN_CODE}
            "-DAVM=$<TARGET_FILE:avm>"
            "-DPASS_REGULAR_EXPRESSION=${arg_PASS_REGULAR_EXPRESSION}"
            "-DAVM_ARGUMENTS=${arg_AVM_ARGUMENTS}"
            "-DINPUT=${arg_INPUT}"
            -P test_cmdline.cmake
            WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

    if (arg_DISABLED)
        set_tests_properties(test_cmdline_${name} PROPERTIES DISABLED 1)
    endif()
endfunction()

#avmShell
cmdline_add_test(shell
        AVM_ARGUMENTS -Dtimeout testdata/sleep.abc
        PASS_REGULAR_EXPRESSION "Error: Error #1502"
        PASS_RETURN_CODE 1)
cmdline_add_test(shell_trace
        AVM_ARGUMENTS testdata/trace1.abc
        PASS_REGULAR_EXPRESSION "single line" "array line1,array line2" "arg1 arg2 arg3" "null")
cmdline_add_test(shell_write
        AVM_ARGUMENTS testdata/write.abc
        PASS_REGULAR_EXPRESSION "part1part2")
cmdline_add_test(shell_exit
        AVM_ARGUMENTS testdata/exit.abc
        PASS_RETURN_CODE 5)
cmdline_add_test(shell_readline
        AVM_ARGUMENTS testdata/readline.abc
        INPUT "test input"
        PASS_REGULAR_EXPRESSION "line=test input")
cmdline_add_test(shell_exec
        AVM_ARGUMENTS testdata/exec.abc
        PASS_REGULAR_EXPRESSION "result=0")
cmdline_add_test(shell_argv_0
        AVM_ARGUMENTS testdata/argv.abc --
        PASS_REGULAR_EXPRESSION "argv\\.length=0")
cmdline_add_test(shell_argv_n
        AVM_ARGUMENTS testdata/argv.abc -- zero one two
        PASS_REGULAR_EXPRESSION
        "argv\\.length=3"
        "argv\\[0\\]=zero"
        "argv\\[1\\]=one"
        "argv\\[2\\]=two")
cmdline_add_test(shell_memlimit_no_value
        AVM_ARGUMENTS -memlimit
        PASS_REGULAR_EXPRESSION "Invalid GC option: -memlimit"
        PASS_RETURN_CODE 1)
cmdline_add_test(shell_load_no_value
        AVM_ARGUMENTS -load
        PASS_REGULAR_EXPRESSION "Invalid GC option: -load"
        PASS_RETURN_CODE 1)
cmdline_add_test(shell_gcwork_no_value
        AVM_ARGUMENTS -gcwork
        PASS_REGULAR_EXPRESSION "Invalid GC option: -gcwork"
        PASS_RETURN_CODE 1)
cmdline_add_test(shell_cache_bindings_no_value
        AVM_ARGUMENTS -cache_bindings
        PASS_REGULAR_EXPRESSION "Unrecognized option -cache_bindings"
        PASS_RETURN_CODE 1)
cmdline_add_test(shell_cache_metadata_no_value
        AVM_ARGUMENTS -cache_metadata
        PASS_REGULAR_EXPRESSION "Unrecognized option -cache_metadata"
        PASS_RETURN_CODE 1)
cmdline_add_test(shell_cache_methods_no_value
        AVM_ARGUMENTS -cache_methods
        PASS_REGULAR_EXPRESSION "Unrecognized option -cache_methods"
        PASS_RETURN_CODE 1)
cmdline_add_test(shell_stack_no_value
        AVM_ARGUMENTS -stack
        PASS_REGULAR_EXPRESSION "Unrecognized option -stack"
        PASS_RETURN_CODE 1)
cmdline_add_test(shell_gcstack_no_value
        AVM_ARGUMENTS -gcstack
        PASS_REGULAR_EXPRESSION "Unrecognized option -gcstack"
        PASS_RETURN_CODE 1)
cmdline_add_test(shell_Dastrace_no_value
        AVM_ARGUMENTS -Dastrace
        PASS_REGULAR_EXPRESSION "Unrecognized option -Dastrace"
        PASS_RETURN_CODE 1)
cmdline_add_test(shell_Dlanguage_no_value
        AVM_ARGUMENTS -Dlanguage
        PASS_REGULAR_EXPRESSION "Unrecognized option -Dlanguage"
        PASS_RETURN_CODE 1)

#debugger
cmdline_add_test(debugger_basic
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "quit"
        PASS_REGULAR_EXPRESSION "6:  public class debug" "(asdb)")
cmdline_add_test(debugger_list
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "list" "list 10" "quit"
        PASS_REGULAR_EXPRESSION "10:     public function pubfunc" "12:[ ]+privfunc\(\);")
cmdline_add_test(debugger_break
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 11" "info break" "quit"
        PASS_REGULAR_EXPRESSION "Breakpoint 1: file testdata.debug.as, 11.")
cmdline_add_test(debugger_stacktrace
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "bt" "quit"
        PASS_REGULAR_EXPRESSION "#0   global.*global\\$init")
cmdline_add_test(debugger_break2
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 11" "delete 1" "break 1" "break 15" "info break" "continue" "quit"
        PASS_REGULAR_EXPRESSION "Breakpoint 1 deleted." "2 at testdata.debug.as:15" "Could not locate specified line.")
cmdline_add_test(debugger_next
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 8" "continue" "next" "step" "quit"
        PASS_REGULAR_EXPRESSION "8:.*print\\(\"in constructor\\(\\)\"\\);" "9:.*}")
cmdline_add_test(debugger_locals
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 19" "continue" "next" "info locals" "next" "info locals" "quit"
        PASS_REGULAR_EXPRESSION 
        "local1 = undefined" 
        "local2 = 10" 
        "local2 = 15")
cmdline_add_test(debugger_arguments
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 19" "continue" "next" "info arguments" "quit"
        PASS_REGULAR_EXPRESSION 
        "arg1 = 110" 
        "arg2 = 115")
cmdline_add_test(debugger_exception
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "continue" "quit"
        PASS_REGULAR_EXPRESSION "Exception has been thrown:")
cmdline_add_test(debugger_where
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 19" "continue" "where" "quit"
        PASS_REGULAR_EXPRESSION
        "locals\\(arg1=110,arg2=115\\) at testdata.debug\\.as:19"
        "init\\(\\) at testdata.debug\\.as:39")
cmdline_add_test(debugger_bt
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 19" "continue" "bt" "quit"
        PASS_REGULAR_EXPRESSION
        "locals\\(arg1=110,arg2=115\\) at testdata.debug\\.as:19"
        "init\\(\\) at testdata.debug.as:39")
cmdline_add_test(debugger_finish
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 19" "continue" "finish" "where" "quit"
        PASS_REGULAR_EXPRESSION
        "#0   global@[0-9a-z]+.global\\$init\\(\\) at testdata.debug\\.as:39")
cmdline_add_test(debugger_set
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 19" "continue" "next" "set local2 = 5" "info locals" "quit"
        PASS_REGULAR_EXPRESSION "local2 = 5")
cmdline_add_test(debugger_print
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "print Function." "quit"
        PASS_REGULAR_EXPRESSION
        "const length = 1"
        "function get prototype\\(\\) = Function")

#selftest
cmdline_add_test(selftest_mmfx_new_array_opts_canFail
        AVM_ARGUMENTS -Dselftest=mmgc,mmfx_array,mmfx_new_array_opts_canFail -memlimit 1024
        PASS_REGULAR_EXPRESSION
        "\\['start', 'mmgc', 'mmfx_array'\\]"
        "\\['test', 'mmgc', 'mmfx_array', 'mmfx_new_array_opts_canFail'\\]"
        "\\['pass', 'mmgc', 'mmfx_array', 'mmfx_new_array_opts_canFail'\\]"
        "\\['end', 'mmgc', 'mmfx_array'\\]")

cmdline_add_test(selftest_mmfx_new_array_opts_oom
        AVM_ARGUMENTS -Dselftest=mmgc,mmfx_array,mmfx_new_array_opts_oom -memlimit 1024
        PASS_RETURN_CODE 128)

cmdline_add_test(selftest_mmfx_new_array_oom
        AVM_ARGUMENTS -Dselftest=mmgc,mmfx_array,mmfx_new_array_oom -memlimit 1024
        PASS_RETURN_CODE 128)

cmdline_add_test(selftest_VMbaseConcurrency
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


cmdline_add_test(selftest_VMbaseSafepoints
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

cmdline_add_test(selftest_VMPIThreads
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