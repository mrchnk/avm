add_library(shell "")
add_executable(avm "")

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

if (CMAKE_HOST_WIN32)
    target_sources(shell
            PRIVATE
            src/WinFile.cpp)
    target_sources(avm
            PRIVATE
            src/avmshellWin.cpp)
    target_link_libraries(avm PRIVATE shell)
elseif (CMAKE_HOST_APPLE)
    target_sources(shell
            PRIVATE
            src/PosixFile.cpp
            src/PosixPartialPlatform.cpp)
    target_sources(avm
            PRIVATE
            src/avmshellMac.cpp)
    target_link_libraries(avm PRIVATE shell)
elseif (CMAKE_HOST_UNIX)
    target_sources(shell
            PRIVATE
            src/PosixFile.cpp
            src/PosixPartialPlatform.cpp)
    target_sources(avm
            PRIVATE
            src/avmshellUnix.cpp)
    target_link_libraries(avm PRIVATE shell Threads::Threads)
endif ()

target_link_libraries(shell extensions core vmbase eval halfmoon)
target_include_directories(core
        PRIVATE
        src generated
        INTERFACE
        include)

include(nativegen)
include(exactgc)

asc_add_command(shell.as SHELL_ABC
        ASC_ARGUMENTS -md -builtin -apiversioning -import ${BUILTIN_ABC})
nativegen("${BUILTIN_ABC};${SHELL_ABC}" generated NATIVEGENS)

set(exactgc_avmshell src/shell_toplevel.as test/shell_test.as src/DebugCLI.h src/ShellCore.h src/SystemClass.h)
set(exactgc_avmplus src/DomainClass.h src/Domain.as)

exactgc("${exactgc_avmshell}" avmshell generated/avmshell-tracers.hh generated/avmshell-tracers.h)
exactgc("${exactgc_avmplus}" avmplus generated/extensions-tracers.hh generated/extensions-tracers.h)

add_custom_target(shell_generated
        DEPENDS ${SHELL_ABC} ${NATIVEGENS}
        generated/avmshell-tracers.hh generated/avmshell-tracers.h
        generated/extensions-tracers.hh generated/extensions-tracers.h)

set(SHELL_ABC ${SHELL_ABC} PARENT_SCOPE)