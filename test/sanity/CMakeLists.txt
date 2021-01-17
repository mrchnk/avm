add_custom_target(test_sanity
        COMMAND ${ASC} -config CONFIG::VERSION=0 -api 0 -in api/harness.as api/client.as
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}
        SOURCES api/harness.as api/client.as)

add_test(NAME test_sanity
        COMMAND avm api/client.abc
        WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR})

add_dependencies(test_sanity avm)
