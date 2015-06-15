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
module derelict.allegro5.types;

private {
    import core.stdc.stdint;
    import core.stdc.time;
}

public {
    version( Windows ) {
        alias off_t = long;
    } else {
        import core.sys.posix.sys.types : off_t;
    }
}


// altime.h
struct ALLEGRO_TIMEOUT {
    ulong __pad1__;
    ulong __pad2__;
}

// base.h
enum ALLEGRO_VERSION = 5;
enum ALLEGRO_SUB_VERSION = 0;
enum ALLEGRO_WIP_VERSION = 10;
enum ALLEGRO_RELEASE_NUMBER = 1;
enum ALLEGRO_VERSION_STR = "5.0.10";
enum ALLEGRO_DATA_STR = "2013";
enum ALLEGRO_DATE = 20130616;
enum uint ALLEGRO_VERSION_INT = (( ALLEGRO_VERSION << 24 ) | ( ALLEGRO_SUB_VERSION << 16 ) |
                                 ( ALLEGRO_WIP_VERSION << 8 ) | ALLEGRO_RELEASE_NUMBER );

enum ALLEGRO_PI = 3.14159265358979323846;

uint AL_ID( int a, int b, int c, int d ) {
    return (( a << 24 ) | ( b << 16 ) | ( c << 8 ) | d );
}

// bitmap.h
struct ALLEGRO_BITMAP;

enum {
    ALLEGRO_MEMORY_BITMAP            = 0x0001,
    ALLEGRO_KEEP_BITMAP_FORMAT       = 0x0002,
    ALLEGRO_FORCE_LOCKING            = 0x0004,
    ALLEGRO_NO_PRESERVE_TEXTURE      = 0x0008,
    ALLEGRO_ALPHA_TEST               = 0x0010,
    _ALLEGRO_INTERNAL_OPENGL         = 0x0020,
    ALLEGRO_MIN_LINEAR               = 0x0040,
    ALLEGRO_MAG_LINEAR               = 0x0080,
    ALLEGRO_MIPMAP                   = 0x0100,
    ALLEGRO_NO_PREMULTIPLIED_ALPHA   = 0x0200,
    ALLEGRO_VIDEO_BITMAP             = 0x0400,
}

// bitmap_draw.h
enum {
    ALLEGRO_FLIP_HORIZONTAL = 0x00001,
    ALLEGRO_FLIP_VERTICAL   = 0x00002,
}

// bitmap_io.h
extern( C ) nothrow {
    alias ALLEGRO_IIO_LOADER_FUNCTION = ALLEGRO_BITMAP* function( const( char )* );
    alias ALLEGRO_IIO_FS_LOADER_FUNCTION = ALLEGRO_BITMAP* function( ALLEGRO_FILE* );
    alias ALLEGRO_IIO_SAVER_FUNCTION = bool function( const( char )*, ALLEGRO_BITMAP* );
    alias ALLEGRO_IIO_FS_SAVER_FUNCTION = bool function( ALLEGRO_FILE*, ALLEGRO_BITMAP* );
}

// bitmap_lock.h
enum {
   ALLEGRO_LOCK_READWRITE  = 0,
   ALLEGRO_LOCK_READONLY   = 1,
   ALLEGRO_LOCK_WRITEONLY  = 2,
}

struct ALLEGRO_LOCKED_REGION {
    void* data;
    int format;
    int pitch;
    int pixel_size;
}

// blender.h
alias ALLEGRO_BLEND_MODE = int;
enum {
   ALLEGRO_ZERO               = 0,
   ALLEGRO_ONE                = 1,
   ALLEGRO_ALPHA              = 2,
   ALLEGRO_INVERSE_ALPHA      = 3,
   ALLEGRO_SRC_COLOR          = 4,
   ALLEGRO_DEST_COLOR         = 5,
   ALLEGRO_INVERSE_SRC_COLOR  = 6,
   ALLEGRO_INVERSE_DEST_COLOR = 7,
   ALLEGRO_NUM_BLEND_MODES,
}

alias ALLEGRO_BLEND_OPERATIONS = int;
enum {
   ALLEGRO_ADD                = 0,
   ALLEGRO_SRC_MINUS_DEST     = 1,
   ALLEGRO_DEST_MINUS_SRC     = 2,
   ALLEGRO_NUM_BLEND_OPERATIONS,
}

// color.h
struct ALLEGRO_COLOR {
    float r, g, b, a;
}

alias ALLEGRO_PIXEL_FORMAT = int;
enum {
    ALLEGRO_PIXEL_FORMAT_ANY = 0,
    ALLEGRO_PIXEL_FORMAT_ANY_NO_ALPHA,
    ALLEGRO_PIXEL_FORMAT_ANY_WITH_ALPHA,
    ALLEGRO_PIXEL_FORMAT_ANY_15_NO_ALPHA,
    ALLEGRO_PIXEL_FORMAT_ANY_16_NO_ALPHA,
    ALLEGRO_PIXEL_FORMAT_ANY_16_WITH_ALPHA,
    ALLEGRO_PIXEL_FORMAT_ANY_24_NO_ALPHA,
    ALLEGRO_PIXEL_FORMAT_ANY_32_NO_ALPHA,
    ALLEGRO_PIXEL_FORMAT_ANY_32_WITH_ALPHA,
    ALLEGRO_PIXEL_FORMAT_ARGB_8888,
    ALLEGRO_PIXEL_FORMAT_RGBA_8888,
    ALLEGRO_PIXEL_FORMAT_ARGB_4444,
    ALLEGRO_PIXEL_FORMAT_RGB_888,
    ALLEGRO_PIXEL_FORMAT_RGB_565,
    ALLEGRO_PIXEL_FORMAT_RGB_555,
    ALLEGRO_PIXEL_FORMAT_RGBA_5551,
    ALLEGRO_PIXEL_FORMAT_ARGB_1555,
    ALLEGRO_PIXEL_FORMAT_ABGR_8888,
    ALLEGRO_PIXEL_FORMAT_XBGR_8888,
    ALLEGRO_PIXEL_FORMAT_BGR_888,
    ALLEGRO_PIXEL_FORMAT_BGR_565,
    ALLEGRO_PIXEL_FORMAT_BGR_555,
    ALLEGRO_PIXEL_FORMAT_RGBX_8888,
    ALLEGRO_PIXEL_FORMAT_XRGB_8888,
    ALLEGRO_PIXEL_FORMAT_ABGR_F32,
    ALLEGRO_PIXEL_FORMAT_ABGR_8888_LE,
    ALLEGRO_PIXEL_FORMAT_RGBA_4444,
    ALLEGRO_NUM_PIXEL_FORMATS
}

// config.h
struct ALLEGRO_CONFIG;
struct ALLEGRO_CONFIG_SECTION;
struct ALLEGRO_CONFIG_ENTRY;

// display.h
enum {
    ALLEGRO_WINDOWED                    = 1 << 0,
    ALLEGRO_FULLSCREEN                  = 1 << 1,
    ALLEGRO_OPENGL                      = 1 << 2,
    ALLEGRO_DIRECT3D_INTERNAL           = 1 << 3,
    ALLEGRO_RESIZABLE                   = 1 << 4,
    ALLEGRO_FRAMELESS                   = 1 << 5,
    ALLEGRO_NOFRAME                     = ALLEGRO_FRAMELESS, /* older synonym */
    ALLEGRO_GENERATE_EXPOSE_EVENTS      = 1 << 6,
    ALLEGRO_OPENGL_3_0                  = 1 << 7,
    ALLEGRO_OPENGL_FORWARD_COMPATIBLE   = 1 << 8,
    ALLEGRO_FULLSCREEN_WINDOW           = 1 << 9,
    ALLEGRO_MINIMIZED                   = 1 << 10,
}

alias ALLEGRO_DISPLAY_OPTIONS = int;
enum {
    ALLEGRO_RED_SIZE,
    ALLEGRO_GREEN_SIZE,
    ALLEGRO_BLUE_SIZE,
    ALLEGRO_ALPHA_SIZE,
    ALLEGRO_RED_SHIFT,
    ALLEGRO_GREEN_SHIFT,
    ALLEGRO_BLUE_SHIFT,
    ALLEGRO_ALPHA_SHIFT,
    ALLEGRO_ACC_RED_SIZE,
    ALLEGRO_ACC_GREEN_SIZE,
    ALLEGRO_ACC_BLUE_SIZE,
    ALLEGRO_ACC_ALPHA_SIZE,
    ALLEGRO_STEREO,
    ALLEGRO_AUX_BUFFERS,
    ALLEGRO_COLOR_SIZE,
    ALLEGRO_DEPTH_SIZE,
    ALLEGRO_STENCIL_SIZE,
    ALLEGRO_SAMPLE_BUFFERS,
    ALLEGRO_SAMPLES,
    ALLEGRO_RENDER_METHOD,
    ALLEGRO_FLOAT_COLOR,
    ALLEGRO_FLOAT_DEPTH,
    ALLEGRO_SINGLE_BUFFER,
    ALLEGRO_SWAP_METHOD,
    ALLEGRO_COMPATIBLE_DISPLAY,
    ALLEGRO_UPDATE_DISPLAY_REGION,
    ALLEGRO_VSYNC,
    ALLEGRO_MAX_BITMAP_SIZE,
    ALLEGRO_SUPPORT_NPOT_BITMAP,
    ALLEGRO_CAN_DRAW_INTO_BITMAP,
    ALLEGRO_SUPPORT_SEPARATE_ALPHA,
    ALLEGRO_DISPLAY_OPTIONS_COUNT,
}

enum {
    ALLEGRO_DONTCARE,
    ALLEGRO_REQUIRE,
    ALLEGRO_SUGGEST,
}

alias ALLEGRO_DISPLAY_ORIENTATION = int;
enum {
    ALLEGRO_DISPLAY_ORIENTATION_0_DEGREES,
    ALLEGRO_DISPLAY_ORIENTATION_90_DEGREES,
    ALLEGRO_DISPLAY_ORIENTATION_180_DEGREES,
    ALLEGRO_DISPLAY_ORIENTATION_270_DEGREES,
    ALLEGRO_DISPLAY_ORIENTATION_FACE_UP,
    ALLEGRO_DISPLAY_ORIENTATION_FACE_DOWN,
}

struct ALLEGRO_DISPLAY;

// events.h
alias ALLEGRO_EVENT_TYPE = uint;

enum {
    ALLEGRO_EVENT_JOYSTICK_AXIS               =  1,
    ALLEGRO_EVENT_JOYSTICK_BUTTON_DOWN        =  2,
    ALLEGRO_EVENT_JOYSTICK_BUTTON_UP          =  3,
    ALLEGRO_EVENT_JOYSTICK_CONFIGURATION      =  4,

    ALLEGRO_EVENT_KEY_DOWN                    = 10,
    ALLEGRO_EVENT_KEY_CHAR                    = 11,
    ALLEGRO_EVENT_KEY_UP                      = 12,

    ALLEGRO_EVENT_MOUSE_AXES                  = 20,
    ALLEGRO_EVENT_MOUSE_BUTTON_DOWN           = 21,
    ALLEGRO_EVENT_MOUSE_BUTTON_UP             = 22,
    ALLEGRO_EVENT_MOUSE_ENTER_DISPLAY         = 23,
    ALLEGRO_EVENT_MOUSE_LEAVE_DISPLAY         = 24,
    ALLEGRO_EVENT_MOUSE_WARPED                = 25,

    ALLEGRO_EVENT_TIMER                       = 30,

    ALLEGRO_EVENT_DISPLAY_EXPOSE              = 40,
    ALLEGRO_EVENT_DISPLAY_RESIZE              = 41,
    ALLEGRO_EVENT_DISPLAY_CLOSE               = 42,
    ALLEGRO_EVENT_DISPLAY_LOST                = 43,
    ALLEGRO_EVENT_DISPLAY_FOUND               = 44,
    ALLEGRO_EVENT_DISPLAY_SWITCH_IN           = 45,
    ALLEGRO_EVENT_DISPLAY_SWITCH_OUT          = 46,
    ALLEGRO_EVENT_DISPLAY_ORIENTATION         = 47,
}

bool ALLEGRO_EVENT_TYPE_IS_USER( uint t ) {
    return t >= 512;
}

alias ALLEGRO_GET_EVENT_TYPE = AL_ID;

struct ALLEGRO_EVENT_SOURCE {
    int[ 32 ] __pad = void;
}

template _AL_EVENT_HEADER( T ) {
    ALLEGRO_EVENT_TYPE type;
    T* source;
    double timestamp;
}

struct ALLEGRO_ANY_EVENT {
    mixin _AL_EVENT_HEADER!( ALLEGRO_EVENT_SOURCE );
}

struct ALLEGRO_DISPLAY_EVENT {
    mixin _AL_EVENT_HEADER!( ALLEGRO_DISPLAY );
    int x, y;
    int width, height;
    int orientation;
}

struct ALLEGRO_JOYSTICK_EVENT {
    mixin _AL_EVENT_HEADER!( ALLEGRO_JOYSTICK );
    ALLEGRO_JOYSTICK* id;
    int stick;
    int axis;
    float pos;
    int button;
}

struct ALLEGRO_KEYBOARD_EVENT {
    mixin _AL_EVENT_HEADER!( ALLEGRO_KEYBOARD );
    ALLEGRO_DISPLAY* display;
    int keycode;
    int unichar;
    uint modifiers;
    bool repeat;
}

struct ALLEGRO_MOUSE_EVENT {
    mixin _AL_EVENT_HEADER!( ALLEGRO_MOUSE );
    ALLEGRO_DISPLAY* display;
    int x, y, z, w;
    int dx, dy, dz, dw;
    uint button;
    float pressure;
}

struct ALLEGRO_TIMER_EVENT {
    mixin _AL_EVENT_HEADER!( ALLEGRO_TIMER );
    long count;
    double error;
}

struct ALLEGRO_USER_EVENT {
    mixin _AL_EVENT_HEADER!( ALLEGRO_EVENT_SOURCE );
    void* __internal__descr;
}

union ALLEGRO_EVENT {
    ALLEGRO_EVENT_TYPE type;
    ALLEGRO_ANY_EVENT any;
    ALLEGRO_DISPLAY_EVENT display;
    ALLEGRO_JOYSTICK_EVENT joystick;
    ALLEGRO_KEYBOARD_EVENT keyboard;
    ALLEGRO_MOUSE_EVENT mouse;
    ALLEGRO_TIMER_EVENT timer;
    ALLEGRO_USER_EVENT user;
}

struct ALLEGRO_EVENT_QUEUE;

// file.h
struct ALLEGRO_FILE;

struct ALLEGRO_FILE_INTERFACE {
    extern( C ) nothrow {
        void* function( const( char )*, const( char )* ) fi_fopen;
        void function( ALLEGRO_FILE* ) fi_fclose;
        size_t function( ALLEGRO_FILE*, void*, size_t ) fi_fread;
        size_t function( ALLEGRO_FILE*, const( void )*, size_t ) fi_fwrite;
        bool function( ALLEGRO_FILE* ) fi_fflush;
        long function( ALLEGRO_FILE* ) fi_ftell;
        bool function( ALLEGRO_FILE*, long, int ) fi_fseek;
        bool function( ALLEGRO_FILE* ) fi_feof;
        bool function( ALLEGRO_FILE* ) fi_ferror;
        void function( ALLEGRO_FILE* ) fi_fclearerr;
        int function( ALLEGRO_FILE*, int ) fi_fungetc;
        off_t function( ALLEGRO_FILE* ) fi_fsize;
    }
}

alias ALLEGRO_SEEK = int;
enum {
    ALLEGRO_SEEK_SET = 0,
    ALLEGRO_SEEK_CUR,
    ALLEGRO_SEEK_END,
}

// fshook.h
struct ALLEGRO_FS_ENTRY {
    const( ALLEGRO_FS_INTERFACE )* vtable;
}

alias ALLEGRO_FILE_MODE = int;
enum {
    ALLEGRO_FILEMODE_READ    = 1,
    ALLEGRO_FILEMODE_WRITE   = 1 << 1,
    ALLEGRO_FILEMODE_EXECUTE = 1 << 2,
    ALLEGRO_FILEMODE_HIDDEN  = 1 << 3,
    ALLEGRO_FILEMODE_ISFILE  = 1 << 4,
    ALLEGRO_FILEMODE_ISDIR   = 1 << 5,
}

struct ALLEGRO_FS_INTERFACE {
    extern( C ) nothrow {
        ALLEGRO_FS_ENTRY* function( const( char )* ) fs_create_entry;
        void function( ALLEGRO_FS_ENTRY* ) fs_destroy_entry;
        const( char )* function( ALLEGRO_FS_ENTRY* ) fs_entry_name;
        bool function( ALLEGRO_FS_ENTRY* ) fs_update_entry;
        uint function( ALLEGRO_FS_ENTRY* ) fs_entry_mode;
        time_t function( ALLEGRO_FS_ENTRY* ) fs_entry_atime;
        time_t function( ALLEGRO_FS_ENTRY* ) fs_entry_mtime;
        time_t function( ALLEGRO_FS_ENTRY* ) fs_entry_ctime;
        off_t function( ALLEGRO_FS_ENTRY* ) fs_entry_size;
        bool function( ALLEGRO_FS_ENTRY* ) fs_entry_exists;
        bool function( ALLEGRO_FS_ENTRY* ) fs_remove_entry;

        bool function( ALLEGRO_FS_ENTRY* ) fs_open_directory;
        ALLEGRO_FS_ENTRY* function( ALLEGRO_FS_ENTRY* ) fs_read_directory;
        bool function( ALLEGRO_FS_ENTRY* ) fs_close_directory;

        bool function( const( char )* ) fs_filename_exists;
        bool function( const( char )* ) fs_remove_filename;
        char* function() fs_get_current_directory;
        bool function( const( char )* ) fs_change_directory;
        bool function( const( char )* ) fs_make_directory;

        ALLEGRO_FILE* function( ALLEGRO_FS_ENTRY*, const( char )* ) fs_open_file;
    }
}

// fullscreen_mode.h
enum _AL_MAX_JOYSTICK_AXES = 3;
enum _AL_MAX_JOYSTICK_STICKS = 8;
enum _AL_MAX_JOYSTICK_BUTTONS = 32;

struct ALLEGRO_DISPLAY_MODE {
    int width;
    int height;
    int format;
    int refresh_rate;
}

// joystick.h
struct ALLEGRO_JOYSTICK;

struct _Axes {
    float[ _AL_MAX_JOYSTICK_AXES ] axis;
}

struct ALLEGRO_JOYSTICK_STATE {
    _Axes[ _AL_MAX_JOYSTICK_STICKS ] stick;
    int[ _AL_MAX_JOYSTICK_BUTTONS ] button;
}

alias ALLEGRO_JOYFLAGS = int;
enum {
    ALLEGRO_JOYFLAG_DIGITAL  = 0x01,
    ALLEGRO_JOYFLAG_ANALOGUE = 0x02,
}

// keycodes.h
enum {
    ALLEGRO_KEY_A     = 1,
    ALLEGRO_KEY_B        = 2,
    ALLEGRO_KEY_C        = 3,
    ALLEGRO_KEY_D        = 4,
    ALLEGRO_KEY_E        = 5,
    ALLEGRO_KEY_F        = 6,
    ALLEGRO_KEY_G        = 7,
    ALLEGRO_KEY_H        = 8,
    ALLEGRO_KEY_I        = 9,
    ALLEGRO_KEY_J        = 10,
    ALLEGRO_KEY_K        = 11,
    ALLEGRO_KEY_L        = 12,
    ALLEGRO_KEY_M        = 13,
    ALLEGRO_KEY_N        = 14,
    ALLEGRO_KEY_O        = 15,
    ALLEGRO_KEY_P        = 16,
    ALLEGRO_KEY_Q        = 17,
    ALLEGRO_KEY_R        = 18,
    ALLEGRO_KEY_S        = 19,
    ALLEGRO_KEY_T        = 20,
    ALLEGRO_KEY_U        = 21,
    ALLEGRO_KEY_V        = 22,
    ALLEGRO_KEY_W        = 23,
    ALLEGRO_KEY_X        = 24,
    ALLEGRO_KEY_Y        = 25,
    ALLEGRO_KEY_Z        = 26,

    ALLEGRO_KEY_0        = 27,
    ALLEGRO_KEY_1        = 28,
    ALLEGRO_KEY_2        = 29,
    ALLEGRO_KEY_3        = 30,
    ALLEGRO_KEY_4        = 31,
    ALLEGRO_KEY_5        = 32,
    ALLEGRO_KEY_6        = 33,
    ALLEGRO_KEY_7        = 34,
    ALLEGRO_KEY_8        = 35,
    ALLEGRO_KEY_9        = 36,

    ALLEGRO_KEY_PAD_0        = 37,
    ALLEGRO_KEY_PAD_1        = 38,
    ALLEGRO_KEY_PAD_2        = 39,
    ALLEGRO_KEY_PAD_3        = 40,
    ALLEGRO_KEY_PAD_4        = 41,
    ALLEGRO_KEY_PAD_5        = 42,
    ALLEGRO_KEY_PAD_6        = 43,
    ALLEGRO_KEY_PAD_7        = 44,
    ALLEGRO_KEY_PAD_8        = 45,
    ALLEGRO_KEY_PAD_9        = 46,

    ALLEGRO_KEY_F1       = 47,
    ALLEGRO_KEY_F2       = 48,
    ALLEGRO_KEY_F3       = 49,
    ALLEGRO_KEY_F4       = 50,
    ALLEGRO_KEY_F5       = 51,
    ALLEGRO_KEY_F6       = 52,
    ALLEGRO_KEY_F7       = 53,
    ALLEGRO_KEY_F8       = 54,
    ALLEGRO_KEY_F9       = 55,
    ALLEGRO_KEY_F10      = 56,
    ALLEGRO_KEY_F11      = 57,
    ALLEGRO_KEY_F12      = 58,

    ALLEGRO_KEY_ESCAPE   = 59,
    ALLEGRO_KEY_TILDE        = 60,
    ALLEGRO_KEY_MINUS        = 61,
    ALLEGRO_KEY_EQUALS   = 62,
    ALLEGRO_KEY_BACKSPACE    = 63,
    ALLEGRO_KEY_TAB      = 64,
    ALLEGRO_KEY_OPENBRACE    = 65,
    ALLEGRO_KEY_CLOSEBRACE   = 66,
    ALLEGRO_KEY_ENTER        = 67,
    ALLEGRO_KEY_SEMICOLON    = 68,
    ALLEGRO_KEY_QUOTE        = 69,
    ALLEGRO_KEY_BACKSLASH    = 70,
    ALLEGRO_KEY_BACKSLASH2   = 71,
    ALLEGRO_KEY_COMMA        = 72,
    ALLEGRO_KEY_FULLSTOP = 73,
    ALLEGRO_KEY_SLASH        = 74,
    ALLEGRO_KEY_SPACE        = 75,

    ALLEGRO_KEY_INSERT   = 76,
    ALLEGRO_KEY_DELETE   = 77,
    ALLEGRO_KEY_HOME     = 78,
    ALLEGRO_KEY_END      = 79,
    ALLEGRO_KEY_PGUP     = 80,
    ALLEGRO_KEY_PGDN     = 81,
    ALLEGRO_KEY_LEFT     = 82,
    ALLEGRO_KEY_RIGHT        = 83,
    ALLEGRO_KEY_UP       = 84,
    ALLEGRO_KEY_DOWN     = 85,

    ALLEGRO_KEY_PAD_SLASH    = 86,
    ALLEGRO_KEY_PAD_ASTERISK = 87,
    ALLEGRO_KEY_PAD_MINUS    = 88,
    ALLEGRO_KEY_PAD_PLUS = 89,
    ALLEGRO_KEY_PAD_DELETE   = 90,
    ALLEGRO_KEY_PAD_ENTER    = 91,

    ALLEGRO_KEY_PRINTSCREEN  = 92,
    ALLEGRO_KEY_PAUSE        = 93,

    ALLEGRO_KEY_ABNT_C1  = 94,
    ALLEGRO_KEY_YEN      = 95,
    ALLEGRO_KEY_KANA     = 96,
    ALLEGRO_KEY_CONVERT  = 97,
    ALLEGRO_KEY_NOCONVERT    = 98,
    ALLEGRO_KEY_AT       = 99,
    ALLEGRO_KEY_CIRCUMFLEX   = 100,
    ALLEGRO_KEY_COLON2   = 101,
    ALLEGRO_KEY_KANJI        = 102,

    ALLEGRO_KEY_PAD_EQUALS   = 103,
    ALLEGRO_KEY_BACKQUOTE    = 104,
    ALLEGRO_KEY_SEMICOLON2   = 105,
    ALLEGRO_KEY_COMMAND  = 106,
    ALLEGRO_KEY_UNKNOWN      = 107,

    ALLEGRO_KEY_MODIFIERS    = 215,

    ALLEGRO_KEY_LSHIFT   = 215,
    ALLEGRO_KEY_RSHIFT   = 216,
    ALLEGRO_KEY_LCTRL    = 217,
    ALLEGRO_KEY_RCTRL    = 218,
    ALLEGRO_KEY_ALT      = 219,
    ALLEGRO_KEY_ALTGR    = 220,
    ALLEGRO_KEY_LWIN     = 221,
    ALLEGRO_KEY_RWIN     = 222,
    ALLEGRO_KEY_MENU     = 223,
    ALLEGRO_KEY_SCROLLLOCK = 224,
    ALLEGRO_KEY_NUMLOCK  = 225,
    ALLEGRO_KEY_CAPSLOCK = 226,

    ALLEGRO_KEY_MAX,
}

enum {
    ALLEGRO_KEYMOD_SHIFT       = 0x00001,
    ALLEGRO_KEYMOD_CTRL        = 0x00002,
    ALLEGRO_KEYMOD_ALT         = 0x00004,
    ALLEGRO_KEYMOD_LWIN        = 0x00008,
    ALLEGRO_KEYMOD_RWIN        = 0x00010,
    ALLEGRO_KEYMOD_MENU        = 0x00020,
    ALLEGRO_KEYMOD_ALTGR       = 0x00040,
    ALLEGRO_KEYMOD_COMMAND     = 0x00080,
    ALLEGRO_KEYMOD_SCROLLLOCK  = 0x00100,
    ALLEGRO_KEYMOD_NUMLOCK     = 0x00200,
    ALLEGRO_KEYMOD_CAPSLOCK    = 0x00400,
    ALLEGRO_KEYMOD_INALTSEQ   = 0x00800,
    ALLEGRO_KEYMOD_ACCENT1     = 0x01000,
    ALLEGRO_KEYMOD_ACCENT2     = 0x02000,
    ALLEGRO_KEYMOD_ACCENT3     = 0x04000,
    ALLEGRO_KEYMOD_ACCENT4     = 0x08000,
}

// keyboard.h
struct ALLEGRO_KEYBOARD;

struct ALLEGRO_KEYBOARD_STATE {
    ALLEGRO_DISPLAY* display;
    uint[( ALLEGRO_KEY_MAX + 31 ) / 32] __key_down__internal__;
}

// memory.h
struct ALLEGRO_MEMORY_INTERFACE {
    extern( C ) nothrow {
        void* function( size_t, int, const( char )*, const( char )* ) mi_malloc;
        void function( void*, int, const( char )*, const( char )* ) mi_free;
        void* function( void*, size_t, int, const( char )*, const( char )* ) mi_realloc;
        void* function( size_t, size_t, int, const( char )*, const( char )* ) mi_calloc;
    }
}

// monitor.h
struct ALLEGRO_MONITOR_INFO {
    int x1;
    int y1;
    int x2;
    int y2;
}

enum ALLEGRO_DEFAULT_DISPLAY_ADAPTER = -1;

// mouse.h
enum ALLEGRO_MOUSE_MAX_EXTRA_AXES = 4;

struct ALLEGRO_MOUSE;

struct ALLEGRO_MOUSE_STATE {
    int x;
    int y;
    int z;
    int w;
    int[ ALLEGRO_MOUSE_MAX_EXTRA_AXES ] more_axes;
    int button;
    float pressure;
    ALLEGRO_DISPLAY* display;
}

// mouse_cursor.h
struct ALLEGRO_MOUSE_CURSOR;

alias ALLEGRO_SYSTEM_MOUSE_CURSOR = int;
enum {
    ALLEGRO_SYSTEM_MOUSE_CURSOR_NONE        =  0,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_DEFAULT     =  1,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_ARROW       =  2,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_BUSY        =  3,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_QUESTION    =  4,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_EDIT        =  5,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_MOVE        =  6,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_N    =  7,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_W    =  8,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_S    =  9,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_E    = 10,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_NW   = 11,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_SW   = 12,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_SE   = 13,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_RESIZE_NE   = 14,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_PROGRESS    = 15,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_PRECISION   = 16,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_LINK        = 17,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_ALT_SELECT  = 18,
    ALLEGRO_SYSTEM_MOUSE_CURSOR_UNAVAILABLE = 19,
    ALLEGRO_NUM_SYSTEM_MOUSE_CURSORS,
}

// path.h
version( Windows ) {
    enum ALLEGRO_NATIVE_PATH_SEP = '\\';
    enum ALLEGRO_NATIVE_DRIVE_SEP = ':';
} else {
    enum ALLEGRO_NATIVE_PATH_SEP = '/';
    enum ALLEGRO_NATIVE_DRIVE_SEP = '\0';
}

struct ALLEGRO_PATH;

// system.h
struct ALLEGRO_SYSTEM;

enum {
    ALLEGRO_RESOURCES_PATH = 0,
    ALLEGRO_TEMP_PATH,
    ALLEGRO_USER_DATA_PATH,
    ALLEGRO_USER_HOME_PATH,
    ALLEGRO_USER_SETTINGS_PATH,
    ALLEGRO_USER_DOCUMENTS_PATH,
    ALLEGRO_EXENAME_PATH,
    ALLEGRO_LAST_PATH,
}

// timer.h
pure nothrow {
    double ALLEGRO_USECS_TO_SECS( double x ) { return x / 1_000_000; }
    double ALLEGRO_MSECS_TO_SECS( double x ) { return x / 1_000; }
    double ALLEGRO_BPS_TO_SECS( double x ) {
        if( x > 0 ) {
            return 1.0 / x;
        } else {
            return 0;
        }
    }

    double ALLEGRO_BPM_TO_SECS( double x ) {
        if( x > 0 ) {
            return 60.0 / x;
        } else {
            return 0;
        }
    }
}

struct ALLEGRO_TIMER;

// tls.h
alias ALLEGRO_STATE_FLAGS = int;
enum {
    ALLEGRO_STATE_NEW_DISPLAY_PARAMETERS = 0x0001,
    ALLEGRO_STATE_NEW_BITMAP_PARAMETERS  = 0x0002,
    ALLEGRO_STATE_DISPLAY                = 0x0004,
    ALLEGRO_STATE_TARGET_BITMAP          = 0x0008,
    ALLEGRO_STATE_BLENDER                = 0x0010,
    ALLEGRO_STATE_NEW_FILE_INTERFACE     = 0x0020,
    ALLEGRO_STATE_TRANSFORM              = 0x0040,

    ALLEGRO_STATE_BITMAP                 = ALLEGRO_STATE_TARGET_BITMAP + ALLEGRO_STATE_NEW_BITMAP_PARAMETERS,

    ALLEGRO_STATE_ALL                    = 0xffff,
}

struct ALLEGRO_STATE {
    ubyte[ 1024 ] _tls = void;
}

// transformations.h
struct ALLEGRO_TRANSFORM {
    float[4][4] m;
}

// utf8.h
struct ALLEGRO_USTR {
    int mlen;
    int slen;
    ubyte* data;
}

alias ALLEGRO_USTR_INFO = ALLEGRO_USTR;
