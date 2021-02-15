cmdline_test(shell_timeout
        AVM_ARGUMENTS -Dtimeout testdata/sleep.abc
        PASS_REGULAR_EXPRESSION "Error: Error #1502"
        PASS_RETURN_CODE 1)
cmdline_test(shell_trace
        AVM_ARGUMENTS testdata/trace1.abc
        PASS_REGULAR_EXPRESSION "single line" "array line1,array line2" "arg1 arg2 arg3" "null")
cmdline_test(shell_write
        AVM_ARGUMENTS testdata/write.abc
        PASS_REGULAR_EXPRESSION "part1part2")
cmdline_test(shell_exit
        AVM_ARGUMENTS testdata/exit.abc
        PASS_RETURN_CODE 5)
cmdline_test(shell_readline
        AVM_ARGUMENTS testdata/readline.abc
        INPUT "test input"
        PASS_REGULAR_EXPRESSION "line=test input")
cmdline_test(shell_exec
        AVM_ARGUMENTS testdata/exec.abc -- "exit 10"
        PASS_REGULAR_EXPRESSION "result=10")
cmdline_test(shell_argv_0
        AVM_ARGUMENTS testdata/argv.abc --
        PASS_REGULAR_EXPRESSION "argv\\.length=0")
cmdline_test(shell_argv_n
        AVM_ARGUMENTS testdata/argv.abc -- zero one two
        PASS_REGULAR_EXPRESSION
        "argv\\.length=3"
        "argv\\[0\\]=zero"
        "argv\\[1\\]=one"
        "argv\\[2\\]=two")
cmdline_test(shell_memlimit_no_value
        AVM_ARGUMENTS -memlimit
        PASS_REGULAR_EXPRESSION "Invalid GC option: -memlimit"
        PASS_RETURN_CODE 1)
cmdline_test(shell_load_no_value
        AVM_ARGUMENTS -load
        PASS_REGULAR_EXPRESSION "Invalid GC option: -load"
        PASS_RETURN_CODE 1)
cmdline_test(shell_gcwork_no_value
        AVM_ARGUMENTS -gcwork
        PASS_REGULAR_EXPRESSION "Invalid GC option: -gcwork"
        PASS_RETURN_CODE 1)
cmdline_test(shell_cache_bindings_no_value
        AVM_ARGUMENTS -cache_bindings
        PASS_REGULAR_EXPRESSION "Unrecognized option -cache_bindings"
        PASS_RETURN_CODE 1)
cmdline_test(shell_cache_metadata_no_value
        AVM_ARGUMENTS -cache_metadata
        PASS_REGULAR_EXPRESSION "Unrecognized option -cache_metadata"
        PASS_RETURN_CODE 1)
cmdline_test(shell_cache_methods_no_value
        AVM_ARGUMENTS -cache_methods
        PASS_REGULAR_EXPRESSION "Unrecognized option -cache_methods"
        PASS_RETURN_CODE 1)
cmdline_test(shell_stack_no_value
        AVM_ARGUMENTS -stack
        PASS_REGULAR_EXPRESSION "Unrecognized option -stack"
        PASS_RETURN_CODE 1)
cmdline_test(shell_gcstack_no_value
        AVM_ARGUMENTS -gcstack
        PASS_REGULAR_EXPRESSION "Unrecognized option -gcstack"
        PASS_RETURN_CODE 1)
cmdline_test(shell_Dastrace_no_value
        AVM_ARGUMENTS -Dastrace
        PASS_REGULAR_EXPRESSION "Unrecognized option -Dastrace"
        PASS_RETURN_CODE 1)
cmdline_test(shell_Dlanguage_no_value
        AVM_ARGUMENTS -Dlanguage
        PASS_REGULAR_EXPRESSION "Unrecognized option -Dlanguage"
        PASS_RETURN_CODE 1)
