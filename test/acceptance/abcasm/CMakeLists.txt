asc_add_target(test_abcasm_helper helper.as HELPER_ABC)

avm_test(RECONFIGURE_RECURSE *.abs AVM_ARGUMENTS ${HELPER_ABC})
avm_test(RECONFIGURE bug_554915a.abs AVM_ARGUMENTS -Dtimeout ${HELPER_ABC} PASS_REGULAR_EXPRESSION "Error: Error #1502")
avm_test(RECONFIGURE bug_554915b.abs AVM_ARGUMENTS -Dtimeout ${HELPER_ABC})
avm_test(RECONFIGURE bug_612641.abs AVM_ARGUMENTS -Djitordie ${HELPER_ABC})
avm_test(RECONFIGURE bug_678952.abs AVM_ARGUMENTS -Ojit ${HELPER_ABC} USES_SWF_VERSIONS)

avm_test(CONFIGURE coverage/float/*.abs FLOAT)
avm_test(CONFIGURE float/*.abs FLOAT)
avm_test(CONFIGURE bug_555006a.abs PASS_REGULAR_EXPRESSION "VerifyError: Error #1024")
avm_test(CONFIGURE bug_555006b.abs PASS_REGULAR_EXPRESSION "VerifyError: Error #1024")
avm_test(CONFIGURE bug_655118.abs PASS_REGULAR_EXPRESSION "ReferenceError: Error #1069")
avm_test(CONFIGURE bug_481171.abs WILL_FAIL)
avm_test(CONFIGURE funcRedef.abs PASS_REGULAR_EXPRESSION "VerifyError: Error #1107")
avm_test(CONFIGURE semanticErrorDuplicateSlotName.abs PASS_REGULAR_EXPRESSION "VerifyError: Error #1107")
avm_test(CONFIGURE traitsSparseSlots.abs PASS_REGULAR_EXPRESSION "VerifyError: Error #1107")

avm_test(CONFIGURE nullCheck/CallStatic.abs DISABLED) # http://watsonexp.corp.adobe.com/#bug=3328170
avm_test(CONFIGURE nullCheck/E.abs DISABLED) # http://watsonexp.corp.adobe.com/#bug=3328170
avm_test(CONFIGURE mops.abs DISABLED) # per compiler dev team no longer support for property names beyond simple qnames e.g. {flash.utils}::ByteArray
avm_test(CONFIGURE mops2.abs DISABLED) #  per compiler dev team no longer support for property names beyond simple qnames e.g. {flash.utils}::ByteArray
avm_test(CONFIGURE catch1.abs DISABLED) # NEEDS INVESTIGATION
avm_test(CONFIGURE parseInt.abs DISABLED) # NEEDS INVESTIGATION
avm_test(CONFIGURE namespaces.abs DISABLED) # Unimplemented opcode pushnamespace
avm_test(CONFIGURE bug_612641.abs DISABLED) # Unimplemented opcode pushnamespace
avm_test(CONFIGURE bug_491056.abs DISABLED) # Unimplemented opcode istype
avm_test(CONFIGURE bug_555006a.abs DISABLED) # NEEDS INVESTIGATION: When run this TC throws 'unexpected error message. expected: VerifyError: Error #1024 actual: VerifyError: Error #1047'
avm_test(CONFIGURE bug_678952.abs DISABLED) # per compiler dev team no longer support for property names beyond simple qnames
avm_test(CONFIGURE nullCheck/H.abs DISABLED) # TEST OBSOLETE per spec no longer supporting hasnext, hasnext2 instruction
avm_test(CONFIGURE coverage/H.abs DISABLED) # TEST OBSOLETE per spec no longer supporting hasnext, hasnext2 instruction

# Disable tests that cannot be compiled with abcasm
avm_test(CONFIGURE adhoc.abs DISABLED)
avm_test(CONFIGURE bug_554915b.abs DISABLED)

avm_test(ADD_RECURSE *.abs
        TARGET test_abcasm
        LABELS acceptance abcasm)

add_dependencies(test_abcasm test_abcasm_helper)
