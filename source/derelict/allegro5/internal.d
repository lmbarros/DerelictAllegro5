module derelict.allegro5.internal;

// Helper for generating library names at compile time.
private import derelict.util.system;

package string genLibNames( string prefix ) {
    import std.string : toLower;

    static if( Derelict_OS_Windows ) {
        enum MonolithNames = "allegro-5.0-monolith.dll,allegro-5.0.11-monolith-mt.dll,allegro-5.0.10-monolith-mt.dll,";

        auto s = prefix.toLower();
        if( s != "allegro" ) {
            s = "allegro_" ~ s;
        }
        s ~= "-5.0.dll," ~ s ~ "-5.0.11-mt.dll," ~ s ~ "-5.0.10-mt.dll";
    }
    else static if( Derelict_OS_Mac ) {
        // TODO Do they build a monolith target on Mac?
        enum MonolithNames = "";

        auto lwr = prefix.toLower;
        auto name = "Allegro";
        if( lwr != "allegro" ) {
            name ~= prefix;
            lwr = "_" ~ lwr;
        }
        else {
            lwr = "";
        }
        auto s = "../Frameworks/"~name~"-5.0.framework,/Library/Frameworks/"~name~"-5.0.framwork,liballegro"~lwr~"-5.0.11.dylib,liballegro"~lwr~"-5.0.dylib";
    }
    else static if( Derelict_OS_Posix ) {
        // TODO What is the monolith name format on other Posix platforms?
        enum MoolithNames = "";
        auto lwr = prefix.toLower;
        if( lwr != "allegro" ) {
            lwr = "_" ~ lwr;
        }
        else {
            lwr = "";
        }
        auto s = "liballegro"~lwr~"-5.0.11.so,liballegro"~lwr~"-5.0.so";
    }
    else {
        static assert( 0, "Allegro library names not yet implemented on this platform." );
    }

    return MonolithNames ~ s;
}