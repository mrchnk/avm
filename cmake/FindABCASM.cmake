find_package(Java REQUIRED COMPONENTS Runtime)

set(ABCASM_URL https://github.com/mrchnk/abcasm/releases/download/v4.0/abcasm.jar)
set(ABCASM_MD5 2f21252872a24cbeeea97a57b4f32e4f)

set(ABCASM_JAR ${CMAKE_BINARY_DIR}/abcasm.jar)

if (NOT EXISTS ABCASM_JAR)
    file(DOWNLOAD ${ABCASM_URL} ${ABCASM_JAR} EXPECTED_HASH MD5=${ABCASM_MD5})
endif()

set(ABCASM ${Java_JAVA_EXECUTABLE} -jar ${ABCASM_JAR})

function(abcasm_add_target target_name file out_abc)
    abcasm_add_command(${file} abc ${ARGN})
    add_custom_target(${target_name} DEPENDS ${abc})
    if (out_abc)
        set(${out_abc} ${abc} PARENT_SCOPE)
    endif ()
endfunction()

function(abcasm_add_command file out_abc)
    cmake_parse_arguments(arg
            # options
            ""
            # one_value_keywords
            "WORKING_DIRECTORY"
            # multi_value_keywords
            ""
            ${ARGN})

    if (arg_WORKING_DIRECTORY)
        get_filename_component(working_directory ${arg_WORKING_DIRECTORY} ABSOLUTE)
    else ()
        set(working_directory ${CMAKE_CURRENT_LIST_DIR})
    endif ()

    get_filename_component(file ${file} ABSOLUTE)

    _get_abc_file(abc ${file})

    _working_path(target ${file})
    get_filename_component(output_directory ${target} DIRECTORY)
    if (NOT output_directory)
        set(output_directory .)
    endif ()

    add_custom_command(OUTPUT ${abc}
            COMMAND ${ABCASM} -input ${target} -o ${output_directory}
            VERBATIM
            WORKING_DIRECTORY ${working_directory})

    if (out_abc)
        set(${out_abc} ${abc} PARENT_SCOPE)
    endif ()
endfunction()

function(_working_path out_var file)
    get_filename_component(file_abs ${file} ABSOLUTE)
    file(RELATIVE_PATH file_work ${working_directory} ${file_abs})
    set(${out_var} ${file_work} PARENT_SCOPE)
endfunction()

function(_get_abc_file out_var file)
    get_filename_component(path ${file} DIRECTORY)
    get_filename_component(name ${file} NAME_WLE)
    if (path)
        set(${out_var} ${path}/${name}.abc PARENT_SCOPE)
    else ()
        set(${out_var} ${name}.abc PARENT_SCOPE)
    endif ()
endfunction()