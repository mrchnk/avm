add_library(VMPI "")

target_sources(VMPI
        PRIVATE
        GenericPortUtils.cpp)

if (${CMAKE_HOST_WIN32})
    target_sources(VMPI
            PRIVATE
            WinDebugUtils.cpp
            WinPortUtils.cpp
            ThreadsWin.cpp)
elseif (${CMAKE_HOST_APPLE})
    target_sources(VMPI
            PRIVATE
            MacDebugUtils.cpp
            MacPortUtils.cpp
            PosixPortUtils.cpp
            ThreadsPosix.cpp)
elseif (${CMAKE_HOST_UNIX})
    target_sources(VMPI
            PRIVATE
            PosixPortUtils.cpp
            PosixSpecificUtils.cpp
            UnixDebugUtils.cpp
            ThreadsPosix.cpp)
endif()

target_link_libraries(VMPI platform shell)
target_include_directories(VMPI PUBLIC ${CMAKE_CURRENT_LIST_DIR})