function (definitions_add_test glob label)
    avm_test(ADD ${glob}
            INCLUDE ${ASSERT_SRC}
            ASC_ARGUMENTS -AS3 -optimize
            TARGET test_as3_Definitions
            LABELS acceptance as3 Definitions ${label})
endfunction()

definitions_add_test(Classes/*/*.as Classes)
definitions_add_test(const/*.as const)
definitions_add_test(Function/*.as Function)
definitions_add_test(FunctionAccessors/*.as FunctionAccessors)
definitions_add_test(Interfaces/*.as Interfaces)
definitions_add_test(Packages/*.as Packages)
definitions_add_test(Super/*.as Super)
definitions_add_test(Variable/*.as Variable)
