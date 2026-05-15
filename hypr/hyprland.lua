-- https://wiki.hypr.land/Configuring/
-- Migrated to Lua for Hyprland 0.55

--------------------
--- PROGRAMS -------
--------------------
_G.terminal    = "kitty"
_G.fileManager = "kitty -e yazi"
_G.menu        = "hyprlauncher"

--------------------
--- MODULES --------
--------------------
require("modules.user_info")
require("modules.env")
require("modules.monitors")
require("modules.autostart")
require("modules.animations")
require("modules.keybinds")
require("modules.io")
require("modules.workspace")
require("themes.theme")
require("modules.xppentab")
require("modules.keyboard_switcher")
