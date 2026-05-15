-------------------
--- KEYBINDINGS ---
-------------------
-- https://wiki.hypr.land/Configuring/Basics/Binds/

local M = "SUPER"          -- main modifier
local MS = "SUPER + SHIFT" -- main modifier + shift

--- Core window management ---
hl.bind(M .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(M .. " + W",      hl.dsp.window.close())
hl.bind(M .. " + M",      hl.dsp.exec_cmd([[ags request "power-menu"]]))
hl.bind(M .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(MS .. " + F",     hl.dsp.window.float({ action = "toggle" }))
hl.bind(M .. " + D",      hl.dsp.exec_cmd("~/.config/rofi/launchers/type-1/launcher.sh"))
-- NOTE (0.55 breaking change): SUPER+P (pseudo) removed — dwindle.pseudotile no longer exists.
hl.bind(M .. " + J",      hl.dsp.layout("togglesplit"))
hl.bind(M .. " + F",      hl.dsp.window.fullscreen())

--- Focus movement ---
hl.bind(M .. " + left",  hl.dsp.focus({ direction = "left"  }))
hl.bind(M .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(M .. " + up",    hl.dsp.focus({ direction = "up"    }))
hl.bind(M .. " + down",  hl.dsp.focus({ direction = "down"  }))

--- Workspace switching (1–9, 0 → 10) ---
for i = 1, 9 do
    hl.bind(M  .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(MS .. " + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(M  .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(MS .. " + 0", hl.dsp.window.move({ workspace = 10 }))

--- Special workspace (scratchpad) ---
hl.bind(M  .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MS .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

--- Scroll through workspaces ---
hl.bind(M .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(M .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

--- Move/resize windows with mouse (mouse = true flag replaces bindm) ---
hl.bind(M .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(M .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--- Multimedia / brightness keys (locked + repeating replaces bindel) ---
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),      { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),    { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("~/.local/bin/brightness-ctl up"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.local/bin/brightness-ctl down"),                { locked = true, repeating = true })

--- Media controls / playerctl (locked replaces bindl) ---
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),    { locked = true })

--- Extras ---
hl.bind(M .. " + R", hl.dsp.exec_cmd("/mnt/secondary/Documents/Alterion/Alterion-Os/scripts/hotreload"))
hl.bind(M .. " + V", hl.dsp.exec_cmd("cursor-clip"))
hl.bind(M .. " + B", hl.dsp.exec_cmd("kitty -e btop"))

--- Screenshot ---
hl.bind("ALT + S", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy]]))

--- Screen record (commented out) ---
-- hl.bind("Alt + R", hl.dsp.exec_cmd("~/.config/gpu-recorder/toggle_record"))
