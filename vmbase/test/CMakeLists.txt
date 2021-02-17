include(disable_tests)

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

disable_tests(
        vmbase_test_safepoints.Simple
        vmbase_test_safepoints.ProducerConsumer
        vmbase_test_safepoints.NestedProducerConsumer
        REASON https://bugzilla.mozilla.org/show_bug.cgi?id=754918)