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
module derelict.allegro5.font;

private {
    import derelict.util.loader,
           derelict.util.system;

    import derelict.allegro5.internal,
           derelict.allegro5.types;

    enum libNames = genLibNames("Font");
}

struct ALLEGRO_FONT {
    void* data;
    int height;
    ALLEGRO_FONT_VTABLE* vtable;
}

struct ALLEGRO_FONT_VTABLE {
    extern(C) nothrow {
        int function(const(ALLEGRO_FONT)*) font_height;
        int function(const(ALLEGRO_FONT)*) font_ascent;
        int function(const(ALLEGRO_FONT)*) font_descent;
        int function(const(ALLEGRO_FONT)*, int) char_length;
        int function(const(ALLEGRO_FONT)*, const(ALLEGRO_USTR)*) text_length;
        int function(const(ALLEGRO_FONT)*, ALLEGRO_COLOR, int, float, float) render_char;
        int function(const(ALLEGRO_FONT)*, ALLEGRO_COLOR, const(ALLEGRO_USTR)*, float, float) render;
        void function(ALLEGRO_FONT*) destroy;
        void function(const(ALLEGRO_FONT)*, const(ALLEGRO_USTR)*, int*, int*, int*, int*) get_text_dimensions;
    }
}

enum {
    ALLEGRO_ALIGN_LEFT       = 0,
    ALLEGRO_ALIGN_CENTRE     = 1,
    ALLEGRO_ALIGN_CENTER     = 1,
    ALLEGRO_ALIGN_RIGHT      = 2,
    ALLEGRO_ALIGN_INTEGER    = 4,
}

extern(C) @nogc nothrow {
    alias da_al_register_font_loader = bool function(const(char)*, ALLEGRO_FONT* function(const(char)*, int, int));
    alias da_al_load_bitmap_font = ALLEGRO_FONT* function(const(char)*);
    alias da_al_load_font = ALLEGRO_FONT* function(const(char)*, int, int);

    alias da_al_grab_font_from_bitmap = ALLEGRO_FONT* function(ALLEGRO_BITMAP*, int, const(int)*);
    alias da_al_create_builtin_font = ALLEGRO_FONT* function();

    alias da_al_draw_ustr = void function(const(ALLEGRO_FONT)*, ALLEGRO_COLOR, float, float, int, const(ALLEGRO_USTR)*);
    alias da_al_draw_text = void function(const(ALLEGRO_FONT)*, ALLEGRO_COLOR, float, float, int, const(char)*);
    alias da_al_draw_justified_text = void function(const(ALLEGRO_FONT)*, ALLEGRO_COLOR, float, float, float, float, int, const(char)*);
    alias da_al_draw_justified_ustr = void function(const(ALLEGRO_FONT)*, ALLEGRO_COLOR, float, float, float, float, int, const(ALLEGRO_USTR)*);
    alias da_al_draw_textf = void function(const(ALLEGRO_FONT)*, ALLEGRO_COLOR, float, float, int, const(char)*, ...);
    alias da_al_draw_justified_textf = void function(const(ALLEGRO_FONT)*, ALLEGRO_COLOR, float, float, float, float, int, const(char)*, ...);
    alias da_al_get_text_width = int function(const(ALLEGRO_FONT)*, const(char)*);
    alias da_al_get_ustr_width = int function(const(ALLEGRO_FONT)*, const(ALLEGRO_USTR)*);
    alias da_al_get_font_line_height = int function(const(ALLEGRO_FONT)*);
    alias da_al_get_font_ascent = int function(const(ALLEGRO_FONT)*);
    alias da_al_get_font_descent = int function(const(ALLEGRO_FONT)*);
    alias da_al_destroy_font = void function(ALLEGRO_FONT*);
    alias da_al_get_ustr_dimensions = void function(const(ALLEGRO_FONT)*, const(ALLEGRO_USTR)*, int*, int*, int*, int*);
    alias da_al_get_text_dimensions = void function(const(ALLEGRO_FONT)*, const(char)*, int*, int*, int*, int*);
    alias da_al_init_font_addon = void function();
    alias da_al_shutdown_font_addon = void function();
    alias da_al_get_allegro_font_version = uint function();
}

__gshared {
    da_al_register_font_loader al_register_font_loader;
    da_al_load_bitmap_font al_load_bitmap_font;
    da_al_load_font al_load_font;
    da_al_grab_font_from_bitmap al_grab_font_from_bitmap;
    da_al_create_builtin_font al_create_builtin_font;
    da_al_draw_ustr al_draw_ustr;
    da_al_draw_text al_draw_text;
    da_al_draw_justified_text al_draw_justified_text;
    da_al_draw_justified_ustr al_draw_justified_ustr;
    da_al_draw_textf al_draw_textf;
    da_al_draw_justified_textf al_draw_justified_textf;
    da_al_get_text_width al_get_text_width;
    da_al_get_ustr_width al_get_ustr_width;
    da_al_get_font_line_height al_get_font_line_height;
    da_al_get_font_ascent al_get_font_ascent;
    da_al_get_font_descent al_get_font_descent;
    da_al_destroy_font al_destroy_font;
    da_al_get_ustr_dimensions al_get_ustr_dimensions;
    da_al_get_text_dimensions al_get_text_dimensions;
    da_al_init_font_addon al_init_font_addon;
    da_al_shutdown_font_addon al_shutdown_font_addon;
    da_al_get_allegro_font_version al_get_allegro_font_version;
}

class DerelictAllegro5FontLoader : SharedLibLoader {
    public this() {
        super(libNames);
    }

    protected override void loadSymbols() {
        bindFunc(cast(void**)&al_register_font_loader, "al_register_font_loader");
        bindFunc(cast(void**)&al_load_bitmap_font, "al_load_bitmap_font");
        bindFunc(cast(void**)&al_load_font, "al_load_font");
        bindFunc(cast(void**)&al_grab_font_from_bitmap, "al_grab_font_from_bitmap");
        bindFunc(cast(void**)&al_create_builtin_font, "al_create_builtin_font");
        bindFunc(cast(void**)&al_draw_ustr, "al_draw_ustr");
        bindFunc(cast(void**)&al_draw_text, "al_draw_text");
        bindFunc(cast(void**)&al_draw_justified_text, "al_draw_justified_text");
        bindFunc(cast(void**)&al_draw_justified_ustr, "al_draw_justified_ustr");
        bindFunc(cast(void**)&al_draw_textf, "al_draw_textf");
        bindFunc(cast(void**)&al_draw_justified_textf, "al_draw_justified_textf");
        bindFunc(cast(void**)&al_get_text_width, "al_get_text_width");
        bindFunc(cast(void**)&al_get_ustr_width, "al_get_ustr_width");
        bindFunc(cast(void**)&al_get_font_line_height, "al_get_font_line_height");
        bindFunc(cast(void**)&al_get_font_ascent, "al_get_font_ascent");
        bindFunc(cast(void**)&al_get_font_descent, "al_get_font_descent");
        bindFunc(cast(void**)&al_destroy_font, "al_destroy_font");
        bindFunc(cast(void**)&al_get_text_dimensions, "al_get_text_dimensions");
        bindFunc(cast(void**)&al_init_font_addon, "al_init_font_addon");
        bindFunc(cast(void**)&al_shutdown_font_addon, "al_shutdown_font_addon");
        bindFunc(cast(void**)&al_get_allegro_font_version, "al_get_allegro_font_version");
    }
}

__gshared DerelictAllegro5FontLoader DerelictAllegro5Font;

shared static this() {
    DerelictAllegro5Font = new DerelictAllegro5FontLoader;
}