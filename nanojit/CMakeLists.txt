add_library(nanojit
        NativeX64.cpp
        Allocator.cpp
        Assembler.cpp
        CodeAlloc.cpp
        Containers.cpp
        Fragmento.cpp
        LIR.cpp
        njconfig.cpp
        RegAlloc.cpp)

target_link_libraries(nanojit core)
target_include_directories(nanojit PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})