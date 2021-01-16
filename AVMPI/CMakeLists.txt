add_library(AVMPI "")

target_sources(AVMPI
        PRIVATE
        AvmAssert.cpp
        float4Support.cpp

        PUBLIC
        AVMPI.h)

if (${CMAKE_HOST_WIN32})
    target_sources(AVMPI
            PRIVATE
            MMgcPortWin.cpp
            SpyUtilsWin.cpp)
elseif(${CMAKE_HOST_APPLE})
    target_sources(AVMPI
            PRIVATE
            PosixMMgcPortUtils.cpp
            MMgcPortMac.cpp
            SpyUtilsPosix.cpp)
elseif(${CMAKE_HOST_UNIX})
    target_sources(AVMPI
            PRIVATE
            PosixMMgcPortUtils.cpp
            MMgcPortUnix.cpp)
endif()

target_link_libraries(AVMPI VMPI shell)
target_include_directories(AVMPI PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})