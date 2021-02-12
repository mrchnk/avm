include(utils)

function(avm_test command glob)
    file(GLOB files ${glob})
    if (command MATCHES _RECURSE$)
        string(REGEX REPLACE _RECURSE$ "" command ${command})
        file(GLOB_RECURSE files ${glob})
    endif ()
    if (command STREQUAL RECONFIGURE)
        _avm_test_set_property("${files}" PROPERTY AVM_TEST_ARGUMENTS ${ARGN})
    elseif (command STREQUAL CONFIGURE)
        _avm_test_set_property("${files}" APPEND PROPERTY AVM_TEST_ARGUMENTS ${ARGN})
    elseif (command STREQUAL IGNORE)
        _avm_test_set_property("${files}" PROPERTY AVM_TEST_IGNORE 1)
    elseif (command STREQUAL ADD)
        _avm_test_parse_arguments(${ARGN})
        set(abcs "")
        foreach (file ${files})
            _avm_test_add(${file} abc ${ARGN})
            if (abc)
                list(APPEND abcs ${abc})
            endif()
        endforeach ()
        if (arg_TARGET)
            add_custom_target(${arg_TARGET} DEPENDS ${abcs})
        else()
            get_directory_property(dir_abcs AVM_TEST_ABC)
            set_directory_properties(PROPERTIES
                    AVM_TEST_ABCS "${dir_abcs};${abcs}")
        endif()
    else ()
        message(SEND_ERROR "Unknown command ${command}")
    endif ()
endfunction()

function(avm_test_target target_name)
    get_directory_property(abc AVM_TEST_ABCS)
    add_custom_target(${target_name} DEPENDS ${abc})
endfunction()

macro(_avm_test_set_property files)
    foreach (file ${files})
        set_property(SOURCE ${file} ${ARGN})
    endforeach ()
endmacro()

function(_avm_test_get_name out_var dir file)
    file(RELATIVE_PATH file ${dir} ${file})
    get_filename_component(path ${file} DIRECTORY)
    get_filename_component(name ${file} NAME_WLE)
    if (path)
        string(REPLACE "/" "_" name "${path}/${name}")
    endif ()
    set(${out_var} ${name} PARENT_SCOPE)
endfunction()

function(_avm_test_add file out_abc)
    get_property(skip SOURCE ${file} PROPERTY AVM_TEST_IGNORE)
    get_property(arguments SOURCE ${file} PROPERTY AVM_TEST_ARGUMENTS)
    if (skip)
        return()
    endif ()
    _avm_test_parse_arguments(${arguments} ${ARGN})
    _avm_test_get_name(test_name ${CMAKE_SOURCE_DIR} ${file})

    get_filename_component(ext ${file} LAST_EXT)
    if (ext STREQUAL .as)
        _avm_test_support(${file} support)
        asc_add_command(${file} abc
                SUPPORT ${arg_SUPPORT}
                SUPPORT ${support}
                INCLUDE ${arg_INCLUDE}
                IMPORT ${arg_IMPORT}
                ASC_ARGUMENTS ${arg_ASC_ARGUMENTS}
                WORKING_DIRECTORY ${working_directory})
        _avm_test_abc(${test_name} "${abc}" ${arguments} ${ARGN})
    elseif (ext STREQUAL .abs)
        abcasm_add_command(${file} abc ${arguments}
                WORKING_DIRECTORY ${working_directory})
        _avm_test_abc(${test_name} "${abc}" ${arguments} ${ARGN})
    elseif (ext STREQUAL .abc)
        _avm_test_abc(${test_name} "${file}" ${arguments} ${ARGN})
    else ()
        message(SEND_ERROR "Unsupported test source ${file}")
    endif ()
    if (out_abc)
        if (disabled)
            set(${out_abc} "" PARENT_SCOPE)
        else()
            set(${out_abc} "${abc}" PARENT_SCOPE)
        endif()
    endif()
endfunction()

function(_avm_test_abc test_name abcs)
    _avm_test_parse_arguments(${ARGN})

    set(avm_arguments ${arg_AVM_ARGUMENTS})
    foreach (abc ${abcs})
        working_path(abc ${abc})
        list(APPEND avm_arguments ${abc})
    endforeach ()
    if (arg_TEST_ARGUMENTS)
        list(APPEND avm_arguments "--" ${arg_TEST_ARGUMENTS})
    endif ()

    if (arg_SWF_VERSIONS)
        foreach (swf_ver ${arg_SWF_VERSIONS})
            _avm_test_run(${test_name}_SWF_${swf_ver} -swfversion ${swf_ver} ${avm_arguments})
        endforeach ()
    elseif (arg_API_VERSIONS)
        foreach (api_ver ${arg_API_VERSIONS})
            _avm_test_run(${test_name}_API_${api_ver} -api ${api_ver} ${avm_arguments})
        endforeach ()
    elseif (arg_NORMAL_JIT_INTERP)
        foreach (mode "" -Ojit -Dinterp)
            if (mode)
                set(modename ${mode})
            else ()
                set(modename normal)
            endif ()
            _avm_test_run(${test_name}_MODE_${modename} ${mode} ${avm_arguments})
        endforeach ()
    else ()
        _avm_test_run(${test_name} ${avm_arguments})
    endif ()

endfunction()

macro(_avm_test_parse_arguments)
    cmake_parse_arguments(arg
            # options
            "DISABLED;FLOAT;SHELL;GREEDY;WILL_FAIL;USES_SWF_VERSIONS;NORMAL_JIT_INTERP"
            # one_value_keywords
            "PASS_RETURN_CODE;PASS_REGULAR_EXPRESSION;WORKING_DIRECTORY;TARGET"
            # multi_value_keywords
            "SUPPORT;INCLUDE;IMPORT;DEPENDS;ABC;ASC_ARGUMENTS;AVM_ARGUMENTS;TEST_ARGUMENTS;SWF_VERSIONS;API_VERSIONS;LABELS"
            ${ARGN})

    if (arg_WORKING_DIRECTORY)
        get_filename_component(working_directory ${arg_WORKING_DIRECTORY} ABSOLUTE)
    else ()
        set(working_directory ${CMAKE_CURRENT_LIST_DIR})
    endif ()

    if (arg_DISABLED)
        set(disabled DISABLED)
    endif ()

    if (arg_FLOAT AND NOT AVM_TEST_FLOAT)
        set(disabled DISABLED)
    endif ()

    if (arg_FLOAT)
        list(APPEND arg_AVM_ARGUMENTS -abcfuture)
    endif()

    if (arg_USES_SWF_VERSIONS)
        set(arg_SWF_VERSIONS 9 10 11 12 13 14 15 16 17 18)
    endif ()
endmacro()

function(_avm_test_support file out_var)
    get_filename_component(dir ${file} DIRECTORY)
    get_filename_component(name ${file} NAME_WLE)
    set(sup_dir ${dir}/${name})
    file(GLOB support ${sup_dir}/*.as)
    if (support)
        list(LENGTH support length)
        if (length GREATER 1)
            foreach (sup ${support})
                get_filename_component(sup_name ${sup} NAME)
                if (NOT sup_name MATCHES "^[A-Z]_")
                    message(WARNING "Support code at ${sup_dir} may not be ordered correctly")
                    break()
                endif ()
            endforeach ()
        endif ()
    endif ()
    set(${out_var} "${support}" PARENT_SCOPE)
endfunction()

macro(_avm_test_run test_name)
    add_test(NAME ${test_name}
            COMMAND avm ${ARGN}
            WORKING_DIRECTORY ${working_directory})

    set_tests_properties(${test_name} PROPERTIES
            LABELS "avm_test;${arg_LABELS}")

    if (disabled)
        set_tests_properties(${test_name} PROPERTIES DISABLED 1)
    endif ()
    if (arg_PASS_RETURN_CODE OR arg_WILL_FAIL)
        set_tests_properties(${test_name} PROPERTIES WILL_FAIL 1)
    endif ()
    if (arg_PASS_REGULAR_EXPRESSION)
        set_tests_properties(${test_name} PROPERTIES PASS_REGULAR_EXPRESSION ${arg_PASS_REGULAR_EXPRESSION})
    endif ()
endmacro()