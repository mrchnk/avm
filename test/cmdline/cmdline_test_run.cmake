set(CMAKE_MESSAGE_CONTEXT_SHOW false)

if (INPUT)
    file(WRITE ${NAME}.input)
    foreach(line ${INPUT})
        file(APPEND ${NAME}.input ${line} "\n")
    endforeach()
    list(APPEND args INPUT_FILE ${NAME}.input)
endif()

execute_process(COMMAND ${AVM} ${AVM_ARGUMENTS}
        OUTPUT_VARIABLE output ERROR_VARIABLE output
        RESULT_VARIABLE return_code
        COMMAND_ECHO STDOUT
        ${args})

if (INPUT)
    file(REMOVE ${NAME}.input)
endif()

if (output)
    message(${output})
endif()

if (PASS_RETURN_CODE)
    if (NOT return_code EQUAL ${PASS_RETURN_CODE})
        message(FATAL_ERROR "Expected return code is [${PASS_RETURN_CODE}]. Actual=[${return_code}]")
    endif()
elseif (NOT WILL_FAIL)
    if (NOT return_code EQUAL 0)
        message(FATAL_ERROR "Command failed. Return=[${return_code}]")
    endif()
endif()

foreach(expr ${PASS_REGULAR_EXPRESSION})
    if (NOT output MATCHES ${expr})
        message(SEND_ERROR "Required regular expression not found. Regex=[${expr}]")
    endif()
endforeach()
