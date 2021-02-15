cmdline_test(repl
        AVM_ARGUMENTS -repl
        INPUT ".quit")
cmdline_test(repl_return
        AVM_ARGUMENTS -repl
        INPUT "{123}{456}" ".quit"
        PASS_REGULAR_EXPRESSION 456)
cmdline_test(repl_print
        AVM_ARGUMENTS -repl
        INPUT "{print('PASS')}{456}" ".quit"
        PASS_REGULAR_EXPRESSION PASS)
cmdline_test(repl_input
        AVM_ARGUMENTS -repl
        INPUT
        ".input"
        "import avmplus.*"
        "System.write('FOO')"
        "System.write('BAR')"
        ".end"
        ".quit"
        PASS_REGULAR_EXPRESSION FOOBAR)
cmdline_test(repl_time
        AVM_ARGUMENTS -repl
        INPUT ".time {t=getTimer()+1000}{while (getTimer()<t){}}" ".quit"
        PASS_REGULAR_EXPRESSION "Elapsed time:")
cmdline_test(repl_load
        AVM_ARGUMENTS -repl
        INPUT ".load testdata/write.as" ".quit"
        PASS_REGULAR_EXPRESSION
        "part1part2")