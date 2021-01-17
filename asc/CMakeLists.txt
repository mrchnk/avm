find_package(Java REQUIRED COMPONENTS Runtime)

set(TOPLEVEL_ABC ${CMAKE_CURRENT_LIST_DIR}/../generated/shell_toplevel.abc)
set(BUILTIN_ABC ${CMAKE_CURRENT_LIST_DIR}/../generated/builtin.abc)
set(ASC ${Java_JAVA_EXECUTABLE} -jar ${CMAKE_CURRENT_LIST_DIR}/asc.jar -import ${BUILTIN_ABC} -import ${TOPLEVEL_ABC}
        PARENT_SCOPE)