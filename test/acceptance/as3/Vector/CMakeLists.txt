avm_test(CONFIGURE bug_504525.as USES_SWF_VERSIONS)
avm_test(CONFIGURE nonindexproperty.as USES_SWF_VERSIONS)
avm_test(CONFIGURE vectorIndexRangeExceptions.as USES_SWF_VERSIONS)

avm_test(ADD *.as
        INCLUDE ${ASSERT_SRC}
        ASC_ARGUMENTS -AS3 -optimize
        TARGET test_as3_Vector
        LABELS acceptance as3 Vector)