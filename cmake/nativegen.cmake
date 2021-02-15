find_package(Python3 REQUIRED COMPONENTS Interpreter)

set(NATIVEGEN_PY ${CMAKE_SOURCE_DIR}/utils/nativegen.py)

function(nativegen abcs output_directory generated)
    list(GET abcs -1 abc)
    get_filename_component(name ${abc} NAME_WLE)

    set(output "")
    foreach(suffix .h .cpp -classes.hh)
        get_filename_component(gen_src "${output_directory}/${name}${suffix}" ABSOLUTE)
        list(APPEND output ${gen_src})
    endforeach()

    set(${generated} ${output} PARENT_SCOPE)

    add_custom_command(OUTPUT ${output} DEPENDS ${abc}
            COMMAND ${Python3_EXECUTABLE} ${NATIVEGEN_PY} --output=${output_directory} ${abcs}
            VERBATIM
            WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})
endfunction()
