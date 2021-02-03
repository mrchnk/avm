file(GLOB sources testdata/*.as)
foreach (src ${sources})
    file(RELATIVE_PATH src ${CMAKE_CURRENT_LIST_DIR} ${src})
    list(APPEND commands COMMAND ${ASC} -d ${src})
endforeach ()

add_custom_target(test_cmdline
        ${commands}
        SOURCES ${sources}
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

include(cmdline_test.cmake)

include(arguments.cmake)
include(debugger.cmake)
include(selftest.cmake)
include(repl.cmake)