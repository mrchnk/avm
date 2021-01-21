as3_set_arguments(*.as ASC_ARGUMENTS "")

# Disable tests that cannot be compiled with asc
as3_add_arguments(js1_5/Regress/regress-31255.as DISABLED)
as3_add_arguments(js1_5/Regress/regress-191668.as DISABLED)
as3_add_arguments(js1_5/Regress/regress-229006.as DISABLED)
as3_add_arguments(js1_5/Regress/regress-146596.as DISABLED)
as3_add_arguments(js1_5/Regress/regress-352009.as DISABLED)
as3_add_arguments(js1_5/Regress/regress-98901.as DISABLED)
as3_add_arguments(js1_5/Regress/regress-89443.as DISABLED)

as3_find_tests(test_spidermonkey */*)