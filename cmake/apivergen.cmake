asc_add_command(${CMAKE_SOURCE_DIR}/utils/apivergen.as APIVERGEN_ABC
        IMPORT ${CMAKE_SOURCE_DIR}/core/builtin.abc ${CMAKE_SOURCE_DIR}/generated/shell_toplevel.abc)

function(apivergen xml output_directory generated)
    get_filename_component(working_directory ${output_directory} ABSOLUTE)
    get_filename_component(xml ${xml} ABSOLUTE)

    set(output "")
    foreach(name api-versions.as api-versions.cpp api-versions.h api-versions.java)
        list(APPEND output ${working_directory}/${name})
    endforeach()

    set(${generated} ${output} PARENT_SCOPE)

    add_custom_command(OUTPUT ${output}
            DEPENDS ${APIVERGEN_ABC}
            COMMAND avm ${APIVERGEN_ABC} -- ${xml}
            WORKING_DIRECTORY ${working_directory})
endfunction()