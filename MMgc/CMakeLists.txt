add_library(MMgc
        FixedAlloc.cpp
        FixedMalloc.cpp
        GC.cpp
        GCAlloc.cpp
        GCAllocObject.cpp
        GCDebug.cpp
        GCHashtable.cpp
        GCHeap.cpp
        GCLargeAlloc.cpp
        GCLog.cpp
        GCMemoryProfiler.cpp
        GCObject.cpp
        GCPolicyManager.cpp
        GCStack.cpp
        GCTests.cpp
        GCThreads.cpp
        PageMap.cpp
        ZCT.cpp
        GCGlobalNew.cpp
        GCTypes.h)

target_link_libraries(MMgc vmbase)
target_include_directories(MMgc PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})