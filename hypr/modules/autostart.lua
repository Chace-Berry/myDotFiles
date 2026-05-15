-- Autostart commands run once when Hyprland starts.
-- https://wiki.hypr.land/Configuring/Basics/Autostart/

local GTK = "GTK_THEME=catppuccin-mocha-teal-standard+default"

hl.on("hyprland.start", function()

    --- 1. BOOTSTRAP ---
    hl.exec_cmd("dbus-update-activation-environment --all")

    --- 2. AUDIO/VIDEO SERVICES ---
    hl.exec_cmd("rc-service -U pipewire restart")
    hl.exec_cmd("rc-service -U pipewire-pulse restart")
    hl.exec_cmd("rc-service -U wireplumber restart")

    --- 3. WALLPAPER ---
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("awww img /home/chace-berry/Videos/wallpaper_static.png")
    hl.exec_cmd("sleep 1 && awww img /home/chace-berry/Videos/wallpaper_1080p.gif")
    hl.exec_cmd("/home/chace-berry/.config/hypr/scripts/pause_wp")

    --- 4. PORTALS ---
    -- Kill any existing portals, then restart them in sequence.
    -- The double-start (kill at 8s, restart at 10s) works around a known race condition.
    hl.exec_cmd("killall -9 xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-desktop-portal; sleep 2  && " .. GTK .. " /usr/lib/xdg-desktop-portal-hyprland")
    hl.exec_cmd("sleep 3  && " .. GTK .. " /usr/lib/xdg-desktop-portal-gtk")
    hl.exec_cmd("sleep 5  && " .. GTK .. " /usr/lib/xdg-desktop-portal")
    hl.exec_cmd("sleep 8  && killall -9 xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xdg-desktop-portal")
    hl.exec_cmd("sleep 10 && " .. GTK .. " /usr/lib/xdg-desktop-portal-hyprland")
    hl.exec_cmd("sleep 11 && " .. GTK .. " /usr/lib/xdg-desktop-portal-gtk")
    hl.exec_cmd("sleep 13 && " .. GTK .. " /usr/lib/xdg-desktop-portal")

    --- 5. UI ---
    hl.exec_cmd([[bash -c "while true; do wl-gammarelay-rs run; sleep 2; done"]])
    hl.exec_cmd([[bash -c "while true; do ags run ~/Documents/Alterion/Alterion-Os/app.ts; sleep 2; done"]])
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,pkcs11")

    --- 6. APPS ---
    hl.exec_cmd("sleep 3 && kdeconnect-indicator")
    hl.exec_cmd("sleep 5 && steam -silent")
    hl.exec_cmd("sleep 3 && discord")
    hl.exec_cmd("cursor-clip --daemon")

end)
