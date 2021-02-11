#include "Platform.h"
#include "AVMPI.h"

namespace avmshell {

    Platform *gPlatformSingleton = nullptr;

    /* static */ Platform *Platform::GetInstance() {
        AvmAssert(gPlatformSingleton != nullptr);
        return gPlatformSingleton;
    }

    /* static */ void Platform::SetInstance(Platform *platform) {
        gPlatformSingleton = platform;
    }

}