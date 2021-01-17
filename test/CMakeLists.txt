add_custom_target(test_all)

add_subdirectory(sanity)
add_dependencies(test_all test_sanity)

add_subdirectory(acceptance)
add_dependencies(test_all test_acceptance)