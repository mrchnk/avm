add_library(zlib
        adler32.c
        compress.c
        crc32.c
        deflate.c
        gzio.c
        infback.c
        inffast.c
        inflate.c
        inftrees.c
        trees.c
        uncompr.c
        zutil.c
        zlib.h)

target_include_directories(zlib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})