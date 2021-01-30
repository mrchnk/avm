package {

    import flash.utils.*;
    import avmplus.*;

    public function NEW_BYTEARRAY():ByteArray {
        return new ByteArray();
    }

    public function GET_DOMAIN():Domain {
        return Domain.currentDomain;
    }

    public function TEST(setup, run, name):void {
        if (setup) setup();
        var then = new Date();
        var iterations: uint = 0;
        for (;;) {
            var now = new Date();
            if (now - then > 1000.0)
                break;
            iterations++;
            run();
        }
        REPORT(name, 'iterations/second', iterations/((now-then)/1000.0));
    }

}