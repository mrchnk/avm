cmake_minimum_required(VERSION 3.14)
project(avm)

set(CMAKE_CXX_STANDARD 11)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)

include(CTest)
include(GoogleTest)
include(platform)

find_package(ASC)
find_package(ABCASM)

add_compile_definitions(AVMSHELL_BUILD)
add_compile_definitions(DEBUGGER)

add_subdirectory(core)
add_subdirectory(platform)
add_subdirectory(extensions)
add_subdirectory(VMPI)
add_subdirectory(AVMPI)
add_subdirectory(vmbase)
add_subdirectory(shell)
add_subdirectory(MMgc)
add_subdirectory(eval)
add_subdirectory(pcre)
add_subdirectory(other-licenses/lzma)
add_subdirectory(other-licenses/zlib)
add_subdirectory(nanojit)

if (BUILD_TESTING)
    add_subdirectory(test)

    set(BUILD_GMOCK OFF)
    set(INSTALL_GTEST OFF)
    if (${CMAKE_HOST_WIN32})
        set(gtest_force_shared_crt ON)
    endif()
    add_subdirectory(third_party/gtest)
endif()
