add_executable(vmbase_test
        concurrency.cpp
        safepoints.cpp
        threads.cpp)

target_link_libraries(vmbase_test
        vmbase
        gtest
        gtest_main)

gtest_add_tests(TARGET vmbase_test
        TEST_PREFIX vmbase_test_)
