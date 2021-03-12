find_package(Java COMPONENTS Runtime)
include(utils)

set(FLEX_SDK_URL https://downloads.apache.org/flex/4.16.1/binaries/apache-flex-sdk-4.16.1-bin.tar.gz)
set(FLEX_SDK_MD5 0fba6c912c3919ae1b978ca2d053fe07)
set(FLEX_SDK_FILE ${CMAKE_BINARY_DIR}/apache-flex-sdk-4.16.1-bin.tar.gz)

set(ASC_JAR ${CMAKE_BINARY_DIR}/asc.jar)

if (NOT EXISTS ASC_JAR)
    file(DOWNLOAD ${FLEX_SDK_URL} ${FLEX_SDK_FILE} EXPECTED_HASH MD5=${FLEX_SDK_MD5})
    execute_process(
            COMMAND ${CMAKE_COMMAND} -E tar xzf ${FLEX_SDK_FILE} -- apache-flex-sdk-4.16.1-bin/lib/asc.jar
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR})
    file(RENAME ${CMAKE_BINARY_DIR}/apache-flex-sdk-4.16.1-bin/lib/asc.jar ${ASC_JAR})
    file(REMOVE_RECURSE ${CMAKE_BINARY_DIR}/apache-flex-sdk-4.16.1-bin)
    file(REMOVE ${FLEX_SDK_FILE})
endif()

set(ASC ${Java_JAVA_EXECUTABLE} -jar ${ASC_JAR})

function(asc_add_target target_name file out_abc)
    asc_add_command(${file} abc ${ARGN})
    add_custom_target(${target_name} DEPENDS ${abc})
    if (out_abc)
        set(${out_abc} ${abc} PARENT_SCOPE)
    endif ()
endfunction()

function(asc_add_command file out_abc)
    cmake_parse_arguments(arg
            # options
            ""
            # one_value_keywords
            "WORKING_DIRECTORY"
            # multi_value_keywords
            "SUPPORT;INCLUDE;IMPORT;ASC_ARGUMENTS"
            ${ARGN})

    if (arg_WORKING_DIRECTORY)
        get_filename_component(working_directory ${arg_WORKING_DIRECTORY} ABSOLUTE)
    else ()
        set(working_directory ${CMAKE_CURRENT_LIST_DIR})
    endif ()

    get_filename_component(file ${file} ABSOLUTE)

    set(abc "")
    set(commands "")
    set(import "")
    set(include "")

    foreach (inc ${arg_INCLUDE})
        working_path(inc ${inc})
        list(APPEND include -in ${inc})
    endforeach ()

    foreach (imp ${arg_IMPORT})
        working_path(imp ${imp})
        list(APPEND import -import ${imp})
    endforeach ()

    foreach (sup ${arg_SUPPORT})
        abc_file(sup_abc ${sup})
        list(APPEND abc ${sup_abc})
        working_path(sup ${sup})
        working_path(sup_abc ${sup_abc})
        list(APPEND commands COMMAND ${ASC} ${arg_ASC_ARGUMENTS} ${import} ${sup})
        list(APPEND import -import ${sup_abc})
    endforeach ()

    abc_file(target_abc ${file})
    list(APPEND abc ${target_abc})

    working_path(target ${file})
    list(APPEND commands COMMAND ${ASC} ${arg_ASC_ARGUMENTS} ${import} ${include} ${target})

    if (out_abc)
        set(${out_abc} ${abc} PARENT_SCOPE)
    endif ()

    if (NOT Java_FOUND)
        message(WARNING "ASC: cannot generate ${abc} (java runtime required)")
        return()
    endif()

    add_custom_command(OUTPUT ${abc}
            ${commands}
            VERBATIM
            WORKING_DIRECTORY ${working_directory})

endfunction()