add_library(lzma
        Alloc.c
        Bcj2.c
        Bra.c
        Bra86.c
        LzFind.c
        Lzma2Dec.c
        LzmaDec.c
        LzmaLib.c
        LzmaEnc.c)

target_include_directories(lzma PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})