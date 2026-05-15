-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------
-- uid is defined in user_info.lua, loaded before this module

hl.env("XCURSOR_SIZE",             "24")
hl.env("HYPRCURSOR_SIZE",          "24")
hl.env("DBUS_SESSION_BUS_ADDRESS", "unix:path=/run/user/" .. uid .. "/bus")
hl.env("GTK_THEME",                "catppuccin-mocha-teal-standard+default")
hl.env("QT_STYLE_OVERRIDE",        "kvantum")
hl.env("KVANTUM_THEME",            "catppuccin-mocha-teal")
