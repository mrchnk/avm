enable_language(ASM_MASM)

target_sources(platform
        PRIVATE
        coff.cpp
        MathUtilsWin.cpp
        NativeFunctionWin.cpp
        OSDepWin.cpp
        win64setjml.asm)