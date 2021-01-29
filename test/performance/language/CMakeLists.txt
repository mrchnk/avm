avm_test(IGNORE ByteArray/bytearray-test-helper.as)
avm_test(IGNORE String/timetest.as)
avm_test(IGNORE String/ascii.as)
avm_test(IGNORE String/latin1.as)

avm_test(CONFIGURE ByteArray/*.as TEST_ARGUMENTS ByteArray)
avm_test(ADD_RECURSE *.as
        TARGET test_performance_language
        LABELS performance language
        ASC_ARGUMENTS -AS3 -optimize -config CONFIG::desktop=true
        AVM_ARGUMENTS ${REPORT_ABC})