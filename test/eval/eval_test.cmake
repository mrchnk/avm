function(eval_test glob)
    cmake_parse_arguments(arg
            # options
            "DISABLED;FLOAT;WILL_FAIL"
            # one_value_keywords
            "PASS_RETURN_CODE;PASS_REGULAR_EXPRESSION;FAIL_REGULAR_EXPRESSION"
            # multi_value_keywords
            "LABELS"
            ${ARGN})

    file(GLOB files ${glob})
    foreach(file ${files})
        file(RELATIVE_PATH file ${CMAKE_SOURCE_DIR} ${file})
        get_filename_component(path ${file} DIRECTORY)
        get_filename_component(name ${file} NAME_WLE)
        if (path)
            string(REPLACE "/" "_" test_name "${path}/${name}")
        else()
            set(test_name ${name})
        endif()

        add_test(NAME ${test_name}
                COMMAND avm ${file}
                WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})

        set_tests_properties(${test_name} PROPERTIES
                LABELS "avm_test;${arg_LABELS}")

        set(disabled ${arg_DISABLED})
        if (arg_FLOAT AND NOT AVM_TEST_FLOAT)
            set(disabled DISABLED)
        endif()

        if (disabled)
            set_tests_properties(${test_name} PROPERTIES DISABLED 1)
        endif()
        if (arg_PASS_RETURN_CODE OR arg_WILL_FAIL)
            set_tests_properties(${test_name} PROPERTIES WILL_FAIL 1)
        endif()
        if (arg_PASS_REGULAR_EXPRESSION)
            set_tests_properties(${test_name} PROPERTIES PASS_REGULAR_EXPRESSION ${arg_PASS_REGULAR_EXPRESSION})
        endif()
        if (arg_FAIL_REGULAR_EXPRESSION)
            set_tests_properties(${test_name} PROPERTIES FAIL_REGULAR_EXPRESSION ${arg_FAIL_REGULAR_EXPRESSION})
        endif()
    endforeach()
endfunction()