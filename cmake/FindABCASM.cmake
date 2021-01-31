find_package(Java REQUIRED COMPONENTS Runtime)

set(ABCASM_URL https://github.com/mrchnk/abcasm/releases/download/v4.0/abcasm.jar)
set(ABCASM_MD5 2f21252872a24cbeeea97a57b4f32e4f)

set(ABCASM_JAR ${CMAKE_BINARY_DIR}/abcasm.jar)

if (NOT EXISTS ABCASM_JAR)
    file(DOWNLOAD ${ABCASM_URL} ${ABCASM_JAR} EXPECTED_HASH MD5=${ABCASM_MD5})
endif()

set(ABCASM ${Java_JAVA_EXECUTABLE} -jar ${ABCASM_JAR})