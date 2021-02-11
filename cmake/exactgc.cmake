asc_add_command(${CMAKE_SOURCE_DIR}/utils/exactgc.as EXACTGC_ABC
        IMPORT ${CMAKE_SOURCE_DIR}/core/builtin.abc ${CMAKE_SOURCE_DIR}/generated/shell_toplevel.abc)

function(exactgc files namespace tracers interlock)
    get_filename_component(tracers ${tracers} ABSOLUTE)
    get_filename_component(interlock ${interlock} ABSOLUTE)

    add_custom_command(OUTPUT ${tracers} ${interlock}
            COMMAND avm ${EXACTGC_ABC} -- -b ${tracers} -n ${tracers} -i ${interlock} -ns ${namespace} ${files}
            DEPENDS ${EXACTGC_ABC}
            VERBATIM
            WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})
endfunction()