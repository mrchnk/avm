avm_test(RECONFIGURE *.as
        ASC_ARGUMENTS -AS3 -optimize
        INCLUDE ${TEST_ASC_INCLUDE})

avm_test(CONFIGURE bug_526662.as USES_SWF_VERSIONS)
avm_test(CONFIGURE abstract-base-class.as SHELL)
avm_test(CONFIGURE invalid_opcodes.as SHELL)
avm_test(CONFIGURE catchableTimeout.as AVM_ARGUMENTS -Dtimeout)
avm_test(CONFIGURE doubleTimeout.as AVM_ARGUMENTS -Dtimeout WILL_FAIL)
avm_test(CONFIGURE testJitordieSwitch.as AVM_ARGUMENTS -Djitordie PASS_REGULAR_EXPRESSION "JIT failed")

avm_test(ADD *.as TARGET test_misc)
