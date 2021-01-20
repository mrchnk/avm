find_package(Java REQUIRED COMPONENTS Runtime)

if (CMAKE_HOST_WIN32 AND NOT CYGWIN AND CMAKE_HOST_SYSTEM_NAME MATCHES "Windows")
    set(cp_separator "$<SEMICOLON>")
else ()
    set(cp_separator ":")
endif()

foreach(jar abcasm.jar aet.jar antlr-runtime-3.3.jar)
    list(APPEND ABCASM_CLASSPATH ${CMAKE_CURRENT_LIST_DIR}/${jar})
endforeach()
list(JOIN ABCASM_CLASSPATH ${cp_separator} ABCASM_CLASSPATH)

set(ABCASM_MAINCLASS com.adobe.flash.abcasm.ABCasm)

set(ABCASM ${Java_JAVA_EXECUTABLE} -classpath ${ABCASM_CLASSPATH} ${ABCASM_MAINCLASS} PARENT_SCOPE)