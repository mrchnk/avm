add_library(eval
        eval-abc.cpp
        eval-avmplus.cpp
        eval-cogen.cpp
        eval-cogen-expr.cpp
        eval-cogen-stmt.cpp
        eval-compile.cpp
        eval-lex.cpp
        eval-lex-xml.cpp
        eval-parse.cpp
        eval-parse-config.cpp
        eval-parse-expr.cpp
        eval-parse-stmt.cpp
        eval-parse-xml.cpp
        eval-unicode.cpp
        eval-util.cpp)

target_link_libraries(eval core)
target_include_directories(eval PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})