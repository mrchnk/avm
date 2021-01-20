as3_set_arguments(*.as ASC_ARGUMENTS "")

# Ignore tests that cannot be compiled with asc
as3_ignore(js1_5/Regress/regress-31255.as)
as3_ignore(js1_5/Regress/regress-191668.as)
as3_ignore(js1_5/Regress/regress-229006.as)
as3_ignore(js1_5/Regress/regress-146596.as)
as3_ignore(js1_5/Regress/regress-352009.as)
as3_ignore(js1_5/Regress/regress-98901.as)
as3_ignore(js1_5/Regress/regress-89443.as)

as3_find_tests(test_spidermonkey */*)