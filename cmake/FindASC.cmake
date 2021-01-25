find_package(Java REQUIRED COMPONENTS Runtime)

set(TOPLEVEL_ABC ${CMAKE_CURRENT_LIST_DIR}/../generated/shell_toplevel.abc)
set(BUILTIN_ABC ${CMAKE_CURRENT_LIST_DIR}/../generated/builtin.abc)

set(FLEX_SDK_URL https://downloads.apache.org/flex/4.16.1/binaries/apache-flex-sdk-4.16.1-bin.tar.gz)
set(FLEX_SDK_MD5 0fba6c912c3919ae1b978ca2d053fe07)
set(FLEX_SDK_FILE ${CMAKE_BINARY_DIR}/apache-flex-sdk-4.16.1-bin.tar.gz)

set(ASC_JAR ${CMAKE_BINARY_DIR}/asc.jar)

if (NOT EXISTS ASC_JAR)
    if (NOT EXISTS FLEX_SDK_FILE)
        file(DOWNLOAD ${FLEX_SDK_URL} ${FLEX_SDK_FILE} EXPECTED_HASH MD5=${FLEX_SDK_MD5})
    endif ()

    execute_process(
            COMMAND ${CMAKE_COMMAND} -E tar xzf ${FLEX_SDK_FILE} -- apache-flex-sdk-4.16.1-bin/lib/asc.jar
            WORKING_DIRECTORY ${CMAKE_BINARY_DIR})

    file(RENAME ${CMAKE_BINARY_DIR}/apache-flex-sdk-4.16.1-bin/lib/asc.jar ${ASC_JAR})
    file(REMOVE_RECURSE ${CMAKE_BINARY_DIR}/apache-flex-sdk-4.16.1-bin)
endif()

set(ASC ${Java_JAVA_EXECUTABLE} -jar ${ASC_JAR} -import ${BUILTIN_ABC} -import ${TOPLEVEL_ABC})