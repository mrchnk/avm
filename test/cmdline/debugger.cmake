cmdline_test(debugger_basic
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "quit"
        PASS_REGULAR_EXPRESSION "6:  public class debug" "(asdb)")
cmdline_test(debugger_list
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "list" "list 10" "quit"
        PASS_REGULAR_EXPRESSION "10:     public function pubfunc" "12:[ ]+privfunc\(\);")
cmdline_test(debugger_break
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 11" "info break" "quit"
        PASS_REGULAR_EXPRESSION "Breakpoint 1: file testdata.debug.as, 11.")
cmdline_test(debugger_stacktrace
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "bt" "quit"
        PASS_REGULAR_EXPRESSION "#0   global.*global\\$init")
cmdline_test(debugger_break2
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 11" "delete 1" "break 1" "break 15" "info break" "continue" "quit"
        PASS_REGULAR_EXPRESSION "Breakpoint 1 deleted." "2 at testdata.debug.as:15" "Could not locate specified line.")
cmdline_test(debugger_next
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 8" "continue" "next" "step" "quit"
        PASS_REGULAR_EXPRESSION "8:.*print\\(\"in constructor\\(\\)\"\\);" "9:.*}")
cmdline_test(debugger_locals
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 19" "continue" "next" "info locals" "next" "info locals" "quit"
        PASS_REGULAR_EXPRESSION
        "local1 = undefined"
        "local2 = 10"
        "local2 = 15")
cmdline_test(debugger_arguments
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 19" "continue" "next" "info arguments" "quit"
        PASS_REGULAR_EXPRESSION
        "arg1 = 110"
        "arg2 = 115")
cmdline_test(debugger_exception
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "continue" "quit"
        PASS_REGULAR_EXPRESSION "Exception has been thrown:")
cmdline_test(debugger_where
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 19" "continue" "where" "quit"
        PASS_REGULAR_EXPRESSION
        "locals\\(arg1=110,arg2=115\\) at testdata.debug\\.as:19"
        "init\\(\\) at testdata.debug\\.as:39")
cmdline_test(debugger_bt
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 19" "continue" "bt" "quit"
        PASS_REGULAR_EXPRESSION
        "locals\\(arg1=110,arg2=115\\) at testdata.debug\\.as:19"
        "init\\(\\) at testdata.debug.as:39")
cmdline_test(debugger_finish
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 19" "continue" "finish" "where" "quit"
        PASS_REGULAR_EXPRESSION
        "#0   global@[0-9a-z]+.global\\$init\\(\\) at testdata.debug\\.as:39")
cmdline_test(debugger_set
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "break 19" "continue" "next" "set local2 = 5" "info locals" "quit"
        PASS_REGULAR_EXPRESSION "local2 = 5")
cmdline_test(debugger_print
        AVM_ARGUMENTS -d testdata/debug.abc
        INPUT "print Function." "quit"
        PASS_REGULAR_EXPRESSION
        "const length = 1"
        "function get prototype\\(\\) = Function")
