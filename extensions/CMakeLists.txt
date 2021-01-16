add_library(extensions
        SamplerScript.cpp
        Selftest.cpp
        SelftestInit.cpp
        SelftestExec.cpp
        Selftest.h)

target_link_libraries(extensions core)
target_include_directories(extensions PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})