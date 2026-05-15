------------------------------
--- WINDOWS AND WORKSPACES ---
------------------------------
-- https://wiki.hypr.land/Configuring/Window-Rules/
-- https://wiki.hypr.land/Configuring/Workspace-Rules/

--- Layer rules ---
hl.layer_rule { match = { class = "dashboard" },         blur = true        }
hl.layer_rule { match = { class = "dashboard" },         ignore_alpha = 0   }
hl.layer_rule { match = { namespace = "gtk4-layer-shell" }, blur = true      }

--- Window rules ---

-- Ignore maximize requests from all apps.
hl.window_rule {
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
}

-- Fix some dragging issues with XWayland.
hl.window_rule {
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
}

-- hyprland-run launcher window placement.
hl.window_rule {
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
}

--[[
--- Smart gaps / "No gaps when only" (uncomment to enable) ---
hl.workspace { selector = "w[tv1]", gapsout = 0, gapsin = 0 }
hl.workspace { selector = "f[1]",   gapsout = 0, gapsin = 0 }

hl.window_rule {
    name  = "no-gaps-wtv1",
    match = { float = false, workspace = "w[tv1]" },
    border_size = 0,
    rounding    = 0,
}

hl.window_rule {
    name  = "no-gaps-f1",
    match = { float = false, workspace = "f[1]" },
    border_size = 0,
    rounding    = 0,
}
--]]
