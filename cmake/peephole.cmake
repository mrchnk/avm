asc_add_command(${CMAKE_SOURCE_DIR}/utils/peephole.as PEEPHOLE_ABC
        IMPORT ${CMAKE_SOURCE_DIR}/core/builtin.abc ${CMAKE_SOURCE_DIR}/shell/shell.abc)

function(peephole tbl wopcodes output)
    add_custom_command(OUTPUT ${output}
            COMMAND avm ${PEEPHOLE_ABC} -- ${tbl} ${wopcodes} ${output}
            DEPENDS ${PEEPHOLE_ABC}
            VERBATIM
            WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})
endfunction()