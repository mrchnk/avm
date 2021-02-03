include(eval_test.cmake)

eval_test(Basic/*.as
        LABELS eval Basic
        FAIL_REGULAR_EXPRESSION FAIL)
eval_test(GotoStatement/*.as
        LABELS eval GotoStatement)
eval_test(GotoStatement/err/SyntaxError*.as
        LABELS eval GotoStatement
        PASS_REGULAR_EXPRESSION SyntaxError)