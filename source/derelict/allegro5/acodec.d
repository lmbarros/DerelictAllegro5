/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.allegro5.acodec;

private {
    import derelict.util.loader,
           derelict.util.system;
    import derelict.allegro5.internal;

    enum libNames = genLibNames("Acodec");
}

extern(C) @nogc nothrow {
    alias da_al_init_acodec_addon = bool function();
    alias da_al_get_allegro_acodec_version = uint function();
}

__gshared {
    da_al_init_acodec_addon al_init_acodec_addon;
    da_al_get_allegro_acodec_version al_get_allegro_acodec_version;
}

class DerelictAllegro5ACodecLoader : SharedLibLoader {
    public this() {
        super(libNames);
    }

    protected override void loadSymbols() {
        bindFunc(cast(void**)&al_init_acodec_addon, "al_init_acodec_addon");
        bindFunc(cast(void**)&al_get_allegro_acodec_version, "al_get_allegro_acodec_version");
    }
}

__gshared DerelictAllegro5ACodecLoader DerelictAllegro5ACodec;

shared static this() {
    DerelictAllegro5ACodec = new DerelictAllegro5ACodecLoader;
}