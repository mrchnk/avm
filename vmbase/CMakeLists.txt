add_library(vmbase
        VMThread.cpp
        Safepoint.cpp)

target_link_libraries(vmbase VMPI)
target_include_directories(vmbase PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

if (BUILD_TESTING)
    add_subdirectory(test)
endif()