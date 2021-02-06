avm_test(RECONFIGURE *.as ASC_ARGUMENTS -AS3 -optimize)
avm_test(RECONFIGURE vector-push-1.as ASC_ARGUMENTS -optimize)
avm_test(CONFIGURE float-*.as FLOAT)
avm_test(CONFIGURE float4-*.as FLOAT)
avm_test(IGNORE driver.as)

avm_test(ADD *.as
        AVM_ARGUMENTS ${REPORT_ABC}
        TARGET test_performance_asmicro
        LABELS performance asmicro)
