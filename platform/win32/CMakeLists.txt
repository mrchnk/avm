target_sources(platform
        PRIVATE
        coff.cpp
        MathUtilsWin.cpp
        NativeFunctionWin.cpp
        OSDepWin.cpp
        win64setjmp.asm)