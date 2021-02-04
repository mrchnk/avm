function(cmdline_test name)
    cmake_parse_arguments(arg "DISABLED" "PASS_RETURN_CODE" "AVM_ARGUMENTS;INPUT;PASS_REGULAR_EXPRESSION" ${ARGN})
    add_test(NAME test_cmdline_${name}
            COMMAND ${CMAKE_COMMAND}
            -DNAME=${name}
            -DPASS_RETURN_CODE=${arg_PASS_RETURN_CODE}
            "-DAVM=$<TARGET_FILE:avm>"
            "-DPASS_REGULAR_EXPRESSION=${arg_PASS_REGULAR_EXPRESSION}"
            "-DAVM_ARGUMENTS=${arg_AVM_ARGUMENTS}"
            "-DINPUT=${arg_INPUT}"
            -P cmdline_test_run.cmake
            WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

    set_tests_properties(test_cmdline_${name} PROPERTIES LABELS "avm_test;cmdline")

    if (arg_DISABLED)
        set_tests_properties(test_cmdline_${name} PROPERTIES DISABLED 1)
    endif()
endfunction()