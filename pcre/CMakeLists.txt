add_library(pcre
        pcre_chartables.cpp
        pcre_compile.cpp
        pcre_config.cpp
        pcre_exec.cpp
        pcre_fullinfo.cpp
        pcre_get.cpp
        pcre_globals.cpp
        pcre_info.cpp
        pcre_ord2utf8.cpp
        pcre_refcount.cpp
        pcre_study.cpp
        pcre_tables.cpp
        pcre_try_flipped.cpp
        pcre_valid_utf8.cpp
        pcre_version.cpp
        pcre_xclass.cpp
        pcre_newline.cpp)

target_link_libraries(pcre core)
target_include_directories(pcre PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})