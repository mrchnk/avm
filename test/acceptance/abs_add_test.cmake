function(abs_add_test arg_TARGET)
    set(options abcasm/float GREEDY USES_SWF_VERSIONS WILL_FAIL DISABLED FLOAT)
    set(oneValueArgs PASS_REGULAR_EXPRESSION)
    set(multiValueArgs AVM_ARGUMENTS SWF_VERSIONS API_VERSIONS TEST_ARGUMENTS DEPENDS)

    cmake_parse_arguments(PARSE_ARGV 1 arg "${options}" "${oneValueArgs}" "${multiValueArgs}")

    get_filename_component(arg_TARGET ${arg_TARGET} ABSOLUTE)

    file(RELATIVE_PATH arg_TARGET ${AS3_BASEDIR} ${arg_TARGET})
    get_filename_component(name ${arg_TARGET} NAME_WLE)
    get_filename_component(dir ${arg_TARGET} DIRECTORY)

    if (NOT dir)
        set(dir .)
        set(test_name "${AS3_PREFIX}_${name}")
    else()
        string(REPLACE "/" "_" test_name "${AS3_PREFIX}_${dir}_${name}")
    endif()

    if (AS3_HASH_NAMES)
        string(SHA1 test_name ${test_name})
        string(SUBSTRING ${test_name} 0 8 test_name)
        set(test_name "${AS3_PREFIX}__${test_name}")
    endif()

    if (arg_FLOAT)
        set(arg_DISABLED 1)
    endif()

    if (arg_USES_SWF_VERSIONS)
        set(arg_SWF_VERSIONS 9 10 11 12 13 14 15 16 17 18)
    endif()

    foreach(arg ${arg_AVM_ARGUMENTS})
        list(APPEND avm_arguments ${arg})
    endforeach()

    add_custom_target(${test_name}
            COMMAND ${ABCASM} -input ${arg_TARGET} -o ${dir}
            COMMENT Building ${arg_TARGET} for test ${test_name}
            WORKING_DIRECTORY ${AS3_BASEDIR}
            SOURCES ${arg_TARGET})

    add_dependencies(${test_name} ${arg_DEPENDS} ${AS3_DEPENDS})

    if (arg_TEST_ARGUMENTS)
        set(test_arguments "--" ${arg_TEST_ARGUMENTS})
    endif()

    if (arg_SWF_VERSIONS)
        foreach(swf_ver ${arg_SWF_VERSIONS})
            add_test(NAME ${test_name}_SWF_${swf_ver}
                    COMMAND avm -swfversion ${swf_ver} ${avm_arguments} ${dir}/${name}.abc ${test_arguments}
                    WORKING_DIRECTORY ${AS3_BASEDIR})
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
                    COMMAND avm -api ${api_ver} ${avm_arguments} ${dir}/${name}.abc ${test_arguments}
                    WORKING_DIRECTORY ${AS3_BASEDIR})

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
                COMMAND avm ${avm_arguments} ${dir}/${name}.abc ${test_arguments}
                WORKING_DIRECTORY ${AS3_BASEDIR})

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

    if (NOT arg_DISABLED)
        add_dependencies(${AS3_TARGET} ${test_name})
    endif()
endfunction()