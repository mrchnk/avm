avm_test(CONFIGURE JSON/AS3Types.as ASC_ARGUMENTS -md SHELL)
avm_test(CONFIGURE JSON/Classes.as ASC_ARGUMENTS -md SHELL)
avm_test(CONFIGURE JSON/versioned.as
        AVM_ARGUMENTS -api SWF_12
        JSON/versioned_defjson_helper.precompiled.abc
        JSON/versioned_useoldjson_helper.precompiled.abc)

avm_test(CONFIGURE Exceptions/exception_011_rt.as WILL_FAIL)

avm_test(IGNORE Unicode/unicodeUtil.as)
avm_test(IGNORE Unicode/unicodeNegativeUtil.as)
avm_test(IGNORE JSON/versioned_defjson_helper.as)
avm_test(IGNORE JSON/versioned_useoldjson_helper.as)

avm_test(ADD */*.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        TARGET test_ecma3
        LABELS acceptance ecma3)
