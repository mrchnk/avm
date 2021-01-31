function(e4x_add_test glob label)
    avm_test(ADD ${glob}
            ASC_ARGUMENTS -AS3 -optimize
            INCLUDE ${ASSERT_SRC}
            TARGET test_e4x
            LABELS acceptance e4x ${label})
endfunction()

avm_test(CONFIGURE XML/e13_4_4_3.as USES_SWF_VERSIONS)
avm_test(CONFIGURE XML/e13_4_4_29.as USES_SWF_VERSIONS)
avm_test(CONFIGURE XML/e13_4_4_32.as USES_SWF_VERSIONS)

e4x_add_test(Expressions/*.as Expressions)
e4x_add_test(Global/*.as Global)
e4x_add_test(Namespace/*.as Namespace)
e4x_add_test(QName/*.as QName)
e4x_add_test(Regress/*.as Regress)
e4x_add_test(Statements/*.as Statements)
e4x_add_test(TypeConversion/*.as TypeConversion)
e4x_add_test(Types/*.as Types)
e4x_add_test(XML/*.as XML)
e4x_add_test(XMLList/*.as XMLList)