add_library(shell "")
add_executable(avm "")

if (${CMAKE_HOST_WIN32})
    enable_language(ASM_MASM)
    target_sources(avm PRIVATE
            src/avmshellWin.cpp)
    target_link_libraries(avm PRIVATE shell)
elseif (${CMAKE_HOST_APPLE})
    target_sources(avm PRIVATE
            src/avmshellMac.cpp)
    target_link_libraries(avm PRIVATE shell)
elseif (${CMAKE_HOST_UNIX})
    target_sources(avm PRIVATE
            src/avmshellUnix.cpp)
    set(THREADS_PREFER_PTHREAD_FLAG ON)
    find_package(Threads REQUIRED)
    target_link_libraries(avm PRIVATE shell Threads::Threads)
endif ()

target_sources(shell
        PRIVATE
        src/avmshell.cpp
        src/Platform.cpp
        src/ConsoleOutputStream.cpp
        src/DebugCLI.cpp
        src/DomainClass.cpp
        src/FileClass.cpp
        src/FileInputStream.cpp
        src/ShellCore.cpp
        src/SystemClass.cpp
        src/swf.cpp
        src/ShellWorkerGlue.cpp
        src/ShellWorkerDomainGlue.cpp)

if (${CMAKE_HOST_WIN32})
    target_sources(shell
            PRIVATE
            src/WinFile.cpp)
elseif (${CMAKE_HOST_APPLE})
    target_sources(shell
            PRIVATE
            src/PosixFile.cpp
            src/PosixPartialPlatform.cpp)
elseif (${CMAKE_HOST_UNIX})
    target_sources(shell
            PRIVATE
            src/PosixFile.cpp
            src/PosixPartialPlatform.cpp)
endif ()

target_link_libraries(shell extensions generated core vmbase eval)
target_include_directories(core
        PRIVATE
        src generated
        INTERFACE
        include)
