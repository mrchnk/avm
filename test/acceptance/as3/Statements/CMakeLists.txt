function (statements_add_test glob label)
    avm_test(ADD ${glob}
            INCLUDE ${ASSERT_SRC}
            ASC_ARGUMENTS -AS3 -optimize
            TARGET test_as3_Statements
            LABELS acceptance as3 Statements ${label})
endfunction()

statements_add_test(*.as "")
statements_add_test(Exceptions/*.as Exceptions)
statements_add_test(ForEachIn/*.as ForEachIn)
statements_add_test(Switch/*.as Switch)