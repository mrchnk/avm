asc_add_command(${CMAKE_SOURCE_DIR}/utils/errorgen.as ERRORGEN_ABC
        IMPORT ${CMAKE_SOURCE_DIR}/core/builtin.abc ${CMAKE_SOURCE_DIR}/shell/shell.abc)

function(errorgen xml output)
    add_custom_command(OUTPUT ${output}
            COMMAND avm ${ERRORGEN_ABC} -- ${xml}
            DEPENDS ${ERRORGEN_ABC}
            VERBATIM
            WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})
endfunction()