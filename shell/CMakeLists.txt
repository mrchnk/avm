add_library(shell "")

target_sources(shell
        PRIVATE
        avmshell.cpp
        Platform.cpp
        ConsoleOutputStream.cpp
        DebugCLI.cpp
        DomainClass.cpp
        FileClass.cpp
        FileInputStream.cpp
        ShellCore.cpp
        SystemClass.cpp
        swf.cpp
        ShellWorkerGlue.cpp
        ShellWorkerDomainGlue.cpp

        PUBLIC
        avmshell-features.h)

if (${CMAKE_HOST_WIN32})
    target_sources(shell
            PRIVATE
            WinFile.cpp)
elseif (${CMAKE_HOST_APPLE})
    target_sources(shell
            PRIVATE
            PosixFile.cpp
            PosixPartialPlatform.cpp)
elseif (${CMAKE_HOST_UNIX})
    target_sources(shell
            PRIVATE
            PosixFile.cpp
            PosixPartialPlatform.cpp)
endif ()

target_link_libraries(shell extensions generated core vmbase eval)
target_include_directories(shell PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})