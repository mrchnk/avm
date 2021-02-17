include(eval_test.cmake)
include(disable_tests)

eval_test(Basic/*.as
        LABELS eval Basic
        FAIL_REGULAR_EXPRESSION FAIL)
eval_test(GotoStatement/*.as
        LABELS eval GotoStatement)
eval_test(GotoStatement/err/SyntaxError*.as
        LABELS eval GotoStatement
        PASS_REGULAR_EXPRESSION SyntaxError)


disable_tests(
        test_eval_Basic_assign-operators-failing
        test_eval_Basic_vector-failing
        REASON "Not implemented")