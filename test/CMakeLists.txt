add_subdirectory(sanity)
add_subdirectory(acceptance)

add_custom_target(test_all)
add_dependencies(test_all
        test_sanity
        test_acceptance)