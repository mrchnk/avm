function(abs_add_test arg_TARGET)
    set(options FLOAT GREEDY USES_SWF_VERSIONS WILL_FAIL DISABLED)
    set(oneValueArgs PASS_REGULAR_EXPRESSION WORKING_DIRECTORY)
    set(multiValueArgs AVM_ARGUMENTS SWF_VERSIONS API_VERSIONS TEST_ARGUMENTS DEPENDS)

    cmake_parse_arguments(PARSE_ARGV 1 arg "${options}" "${oneValueArgs}" "${multiValueArgs}")

    get_filename_component(abs_TARGET ${arg_TARGET} ABSOLUTE)
    set(test_sources ${abs_TARGET})

    if (arg_WORKING_DIRECTORY)
        get_filename_component(working_directory ${arg_WORKING_DIRECTORY} ABSOLUTE)
    else()
        set(working_directory ${CMAKE_CURRENT_LIST_DIR})
    endif()

    get_filename_component(name ${abs_TARGET} NAME_WLE)
    file(RELATIVE_PATH arg_TARGET ${working_directory} ${abs_TARGET})
    file(RELATIVE_PATH dir ${CMAKE_CURRENT_LIST_DIR} ${abs_TARGET})
    get_filename_component(dir ${dir} DIRECTORY)
    get_filename_component(work_dir ${arg_TARGET} DIRECTORY)

    if (NOT work_dir)
        set(work_dir .)
    endif()
    set(abc ${work_dir}/${name}.abc)

    if (NOT dir)
        set(test_name "${AS3_PREFIX}_${name}")
    else()
        string(REPLACE "/" "_" test_name "${AS3_PREFIX}_${dir}_${name}")
    endif()

    if (AS3_HASH_TARGET)
        string(SHA1 target_name ${test_name})
        string(SUBSTRING ${target_name} 0 8 target_name)
        set(target_name "${AS3_PREFIX}__${target_name}")
    else()
        set(target_name ${test_name})
    endif()

    if (arg_FLOAT)
        set(arg_DISABLED 1)
    endif()

    if (arg_USES_SWF_VERSIONS)
        set(arg_SWF_VERSIONS 9 10 11 12 13 14 15 16 17 18)
    endif()

    add_custom_target(${target_name}
            COMMAND ${ABCASM} -input ${arg_TARGET} -o ${work_dir}
            COMMENT Building ${arg_TARGET} for test ${test_name}
            WORKING_DIRECTORY ${working_directory}
            SOURCES ${arg_TARGET})

    if (arg_DEPENDS)
        add_dependencies(${target_name} ${arg_DEPENDS})
    endif()

    if (AS3_DEPENDS)
        add_dependencies(${target_name} ${AS3_DEPENDS})
    endif()

    if (NOT arg_DISABLED)
        add_dependencies(${AS3_TARGET} ${target_name})
    endif()

    set(avm_arguments ${arg_AVM_ARGUMENTS} ${abc})
    if (arg_TEST_ARGUMENTS)
        list(APPEND avm_arguments "--" ${arg_TEST_ARGUMENTS})
    endif()

    if (arg_SWF_VERSIONS)
        foreach(swf_ver ${arg_SWF_VERSIONS})
            add_test(NAME ${test_name}_SWF_${swf_ver}
                    COMMAND avm -swfversion ${swf_ver} ${avm_arguments}
                    WORKING_DIRECTORY ${working_directory})
            if (arg_WILL_FAIL)
                set_tests_properties(${test_name}_SWF_${swf_ver} PROPERTIES WILL_FAIL 1)
            endif()
            if (arg_DISABLED)
                set_tests_properties(${test_name}_SWF_${swf_ver} PROPERTIES DISABLED 1)
            endif()
            if (arg_PASS_REGULAR_EXPRESSION)
                set_tests_properties(${test_name}_SWF_${swf_ver} PROPERTIES PASS_REGULAR_EXPRESSION ${arg_PASS_REGULAR_EXPRESSION})
            endif()
        endforeach()
    elseif(arg_API_VERSIONS)
        foreach(api_ver ${arg_API_VERSIONS})
            add_test(NAME ${test_name}_API_${api_ver}
                    COMMAND avm -api ${api_ver} ${avm_arguments}
                    WORKING_DIRECTORY ${working_directory})

            if (arg_WILL_FAIL)
                set_tests_properties(${test_name}_API_${api_ver} PROPERTIES WILL_FAIL 1)
            endif()
            if (arg_DISABLED)
                set_tests_properties(${test_name}_API_${api_ver} PROPERTIES DISABLED 1)
            endif()
            if (arg_PASS_REGULAR_EXPRESSION)
                set_tests_properties(${test_name}_API_${api_ver} PROPERTIES PASS_REGULAR_EXPRESSION ${arg_PASS_REGULAR_EXPRESSION})
            endif()
        endforeach()
    else()
        add_test(NAME ${test_name}
                COMMAND avm ${avm_arguments}
                WORKING_DIRECTORY ${working_directory})

        if (arg_WILL_FAIL)
            set_tests_properties(${test_name} PROPERTIES WILL_FAIL 1)
        endif()
        if (arg_DISABLED)
            set_tests_properties(${test_name} PROPERTIES DISABLED 1)
        endif()
        if (arg_PASS_REGULAR_EXPRESSION)
            set_tests_properties(${test_name} PROPERTIES PASS_REGULAR_EXPRESSION ${arg_PASS_REGULAR_EXPRESSION})
        endif()
    endif()

endfunction()