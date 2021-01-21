add_custom_target(test_ecma3)

as3_set_arguments(JSON/AS3Types.as ASC_ARGUMENTS -AS3 -optimize -md SHELL)
as3_set_arguments(JSON/Classes.as ASC_ARGUMENTS -AS3 -optimize -md SHELL)
as3_set_arguments(JSON/versioned.as AVM_ARGUMENTS -api SWF_12 JSON/versioned_defjson_helper.abc_bin JSON/versioned_useoldjson_helper.abc_bin)
as3_set_arguments(Exceptions/exception_011_rt.as WILL_FAIL)

as3_find_tests(test_ecma3 *)
