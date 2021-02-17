# Will disable tests in CI environment
# Used for known failures with reason
#
# Usage:
#
#     disable_tests(test1 test2 REASON Will fail due reason)
#
function(disable_tests)
    if (BUILD_DEVELOPMENT)
        return()
    endif ()
    cmake_parse_arguments(arg "" "" REASON ${ARGN})
    set(test_names ${arg_UNPARSED_ARGUMENTS})
    set(reason ${arg_REASON})

    set_tests_properties(${test_names} PROPERTIES DISABLED 1)
    foreach (test_name ${test_names})
        message(WARNING "Test [${test_name}] was disabled due: ${reason}")
    endforeach ()
endfunction()