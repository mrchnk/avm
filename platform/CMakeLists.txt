add_library(platform "")

target_sources(platform
        PUBLIC
        system-selection.h)

if (${CMAKE_HOST_WIN32})
    add_subdirectory(win32)
elseif (${CMAKE_HOST_APPLE})
    add_subdirectory(mac)
elseif (${CMAKE_HOST_UNIX})
    add_subdirectory(unix)
endif ()

target_link_libraries(platform core)
target_include_directories(platform PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})