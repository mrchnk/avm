function (avm_test command glob)
    file(GLOB files ${glob})
    if (command MATCHES _RECURSE$)
        string(REGEX REPLACE _RECURSE$ "" command ${command})
        file(GLOB_RECURSE files ${glob})
    endif()
    if (command STREQUAL RECONFIGURE)
        _avm_test_set_property("${files}" PROPERTY AVM_TEST_ARGUMENTS ${ARGN})
    elseif (command STREQUAL CONFIGURE)
        _avm_test_set_property("${files}" APPEND PROPERTY AVM_TEST_ARGUMENTS ${ARGN})
    elseif (command STREQUAL IGNORE)
        _avm_test_set_property("${files}" PROPERTY AVM_TEST_IGNORE 1)
    elseif (command STREQUAL ADD)
        foreach(file ${files})
            _avm_test_add(${file} ${ARGN})
        endforeach()
    else()
        message(SEND_ERROR "Unknown command ${command}")
    endif()
endfunction()

macro (_avm_test_set_property files)
    foreach (file ${files})
        set_property(SOURCE ${file} ${ARGN})
    endforeach()
endmacro()

function (_get_name out_var dir file)
    file(RELATIVE_PATH file ${dir} ${file})
    get_filename_component(path ${file} DIRECTORY)
    get_filename_component(name ${file} NAME_WLE)
    if (path)
        string(REPLACE "/" "_" name "${path}/${name}")
    endif()
    set(${out_var} ${name} PARENT_SCOPE)
endfunction()

function (_get_abc_file out_var file)
    get_filename_component(path ${file} DIRECTORY)
    get_filename_component(name ${file} NAME_WLE)
    set(${out_var} ${path}/${name}.abc PARENT_SCOPE)
endfunction()

function (_avm_test_add file)
    get_property(skip SOURCE ${file} PROPERTY AVM_TEST_IGNORE)
    get_property(arguments SOURCE ${file} PROPERTY AVM_TEST_ARGUMENTS)
    if (skip)
        return ()
    endif()
    _avm_parse_arguments(${arguments} ${ARGN})
    _get_name(target_name ${CMAKE_CURRENT_LIST_DIR} ${file})
    _get_name(test_name ${CMAKE_SOURCE_DIR} ${file})

    if (AVM_TEST_HASH_TARGET)
        string(SHA1 target_name ${test_name})
        string(SUBSTRING ${target_name} 0 8 target_name)
        set(target_name "_${target_name}")
    endif()

    if (arg_TARGET)
        set(target_name ${arg_TARGET}_${target_name})
    endif()

    get_filename_component(ext ${file} LAST_EXT)
    if (ext STREQUAL .as)
        asc_add_target(${target_name} ${file} abc ${arguments} ${ARGN})
        avm_add_test(${test_name} "${abc}" ${arguments} ${ARGN})
    elseif (ext STREQUAL .abs)
        abcasm_add_target(${target_name} ${file} abc ${arguments} ${ARGN})
        avm_add_test(${test_name} "${abc}" ${arguments} ${ARGN})
    elseif (ext STREQUAL .abc)
        avm_add_test(${test_name} "${file}" ${arguments} ${ARGN})
    else()
        message(SEND_ERROR "Unsupported test source ${file}")
    endif()
endfunction()

function (avm_add_test test_name abcs)
    _avm_parse_arguments(${ARGN})

    set(avm_arguments ${arg_AVM_ARGUMENTS})
    foreach (abc ${abcs})
        _avm_working_path(abc ${abc})
        list(APPEND avm_arguments ${abc})
    endforeach()
    if (arg_TEST_ARGUMENTS)
        list(APPEND avm_arguments "--" ${arg_TEST_ARGUMENTS})
    endif()

    if (arg_SWF_VERSIONS)
        foreach(swf_ver ${arg_SWF_VERSIONS})
            _avm_test(${test_name}_SWF_${swf_ver} -swfversion ${swf_ver} ${avm_arguments})
        endforeach()
    elseif(arg_API_VERSIONS)
        foreach(api_ver ${arg_API_VERSIONS})
            _avm_test(${test_name}_API_${api_ver} -api ${api_ver} ${avm_arguments})
        endforeach()
    else()
        _avm_test(${test_name} ${avm_arguments})
    endif()

endfunction()

function (asc_add_target target_name file abc_var)
    _avm_parse_arguments(${ARGN})

    foreach (inc ${arg_INCLUDE})
        _avm_working_path(inc ${inc})
        list(APPEND include -in ${inc})
    endforeach()

    foreach (imp ${arg_IMPORT})
        _avm_working_path(imp ${imp})
        list(APPEND import -import ${imp})
    endforeach()

    _avm_support(support ${file})
    foreach (sup ${arg_SUPPORT} ${support})
        _get_abc_file(sup_abc ${sup})
        list(APPEND abc ${sup_abc})
        _avm_working_path(sup ${sup})
        _avm_working_path(sup_abc ${sup_abc})
        list(APPEND commands COMMAND ${ASC} ${arg_ASC_ARGUMENTS} ${import} ${sup})
        list(APPEND import -import ${sup_abc})
    endforeach()


    _get_abc_file(target_abc ${file})
    list(APPEND abc ${target_abc})
    if (abc_var)
        set(${abc_var} ${abc} PARENT_SCOPE)
    endif()

    _avm_working_path(target ${file})
    list(APPEND commands COMMAND ${ASC} ${arg_ASC_ARGUMENTS} ${import} ${include} ${target})

    add_custom_target(${target_name}
            ${commands}
            WORKING_DIRECTORY ${working_directory})

    _avm_add_dependencies()

endfunction()

function (abcasm_add_target target_name file abc_var)
    _avm_parse_arguments(${ARGN})

    _get_abc_file(target_abc ${file})
    if (abc_var)
        set(${abc_var} ${target_abc} PARENT_SCOPE)
    endif()

    _avm_working_path(target ${file})
    get_filename_component(output_directory ${target} DIRECTORY)
    if (NOT output_directory)
        set(output_directory .)
    endif()

    add_custom_target(${target_name}
            COMMAND ${ABCASM} -input ${target} -o ${output_directory}
            WORKING_DIRECTORY ${working_directory})

    _avm_add_dependencies()

endfunction()

macro (_avm_parse_arguments)
    cmake_parse_arguments(arg
            # options
            "DISABLED;FLOAT;SHELL;GREEDY;WILL_FAIL;USES_SWF_VERSIONS"
            # one_value_keywords
            "PASS_RETURN_CODE;PASS_REGULAR_EXPRESSION;WORKING_DIRECTORY;TARGET"
            # multi_value_keywords
            "SUPPORT;INCLUDE;IMPORT;DEPENDS;ABC;ASC_ARGUMENTS;AVM_ARGUMENTS;TEST_ARGUMENTS;SWF_VERSIONS;API_VERSIONS;LABELS"
            ${ARGN})
    
    if (arg_WORKING_DIRECTORY)
        get_filename_component(working_directory ${arg_WORKING_DIRECTORY} ABSOLUTE)
    else()
        set(working_directory ${CMAKE_CURRENT_LIST_DIR})
    endif()
    
    if (arg_DISABLED)
        set(disabled DISABLED)
    endif()
    
    if (arg_FLOAT AND NOT AVM_TEST_FLOAT)
        set(disabled DISABLED)
    endif()

    if (arg_USES_SWF_VERSIONS)
        set(arg_SWF_VERSIONS 9 10 11 12 13 14 15 16 17 18)
    endif()
endmacro()

macro (_avm_add_dependencies)
    if (arg_TARGET)
        if (NOT TARGET ${arg_TARGET})
            add_custom_target(${arg_TARGET})
        endif()

        if (arg_TARGET AND NOT disabled)
            add_dependencies(${arg_TARGET} ${target_name})
        endif()
    endif()
endmacro()

function (_avm_working_path out_var file)
    get_filename_component(file_abs ${file} ABSOLUTE)
    file(RELATIVE_PATH file_work ${working_directory} ${file_abs})
    set(${out_var} ${file_work} PARENT_SCOPE)
endfunction()

macro (_avm_test test_name)
    add_test(NAME ${test_name}
            COMMAND avm ${ARGN}
            WORKING_DIRECTORY ${working_directory})

    set_tests_properties(${test_NAME} PROPERTIES
            LABELS "avm;${arg_LABELS}")

    if (disabled)
        set_tests_properties(${test_name} PROPERTIES DISABLED 1)
    endif()
    if (arg_PASS_RETURN_CODE OR arg_WILL_FAIL)
        set_tests_properties(${test_name} PROPERTIES WILL_FAIL 1)
    endif()
    if (arg_PASS_REGULAR_EXPRESSION)
        set_tests_properties(${test_name} PROPERTIES PASS_REGULAR_EXPRESSION ${arg_PASS_REGULAR_EXPRESSION})
    endif()
endmacro()

function(_avm_support out_var file)
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
    endif()
    set(support ${support} PARENT_SCOPE)
endfunction()