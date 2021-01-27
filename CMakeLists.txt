cmake_minimum_required(VERSION 3.14)
project(avm)

set(CMAKE_CXX_STANDARD 11)
add_definitions(-DAVMSHELL_BUILD)
add_definitions(-DDEBUGGER)
add_executable(avm "")

if (${CMAKE_HOST_WIN32})
    add_definitions(-DWIN32)
    add_definitions(-D_M_X64)
    target_sources(avm
            PRIVATE
            shell/avmshellWin.cpp)
    target_link_libraries(avm shell)
elseif (${CMAKE_HOST_APPLE})
    add_definitions(-D_MAC)
    target_sources(avm
            PRIVATE
            shell/avmshellMac.cpp)
    target_link_libraries(avm shell)
elseif (${CMAKE_HOST_UNIX})
    add_definitions(-DUNIX)
    target_sources(avm
            PRIVATE
            shell/avmshellUnix.cpp)
    set(THREADS_PREFER_PTHREAD_FLAG ON)
    find_package(Threads REQUIRED)
    target_link_libraries(avm PRIVATE shell Threads::Threads)
endif ()

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
find_package(ASC)

add_subdirectory(abcasm)
add_subdirectory(core)
add_subdirectory(platform)
add_subdirectory(extensions)
add_subdirectory(VMPI)
add_subdirectory(AVMPI)
add_subdirectory(vmbase)
add_subdirectory(shell)
add_subdirectory(generated)
add_subdirectory(MMgc)
add_subdirectory(eval)
add_subdirectory(pcre)
add_subdirectory(other-licenses/lzma)
add_subdirectory(other-licenses/zlib)
add_subdirectory(nanojit)

enable_testing()
include(CTest)
add_subdirectory(test)