avm_test(RECONFIGURE_RECURSE *.as ASC_ARGUMENTS -AS3 -optimize INCLUDE ${TEST_ASC_INCLUDE})
avm_test(CONFIGURE JSON/AS3Types.as ASC_ARGUMENTS -md SHELL)
avm_test(CONFIGURE JSON/Classes.as ASC_ARGUMENTS -md SHELL)
avm_test(CONFIGURE JSON/versioned.as
        AVM_ARGUMENTS -api SWF_12
        JSON/versioned_defjson_helper.abc_bin
        JSON/versioned_useoldjson_helper.abc_bin)
avm_test(CONFIGURE Exceptions/exception_011_rt.as WILL_FAIL)

avm_test(ADD */*.as TARGET test_ecma3)
