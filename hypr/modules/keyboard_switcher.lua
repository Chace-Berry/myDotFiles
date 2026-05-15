-- fcitx5 input method framework
hl.env("QT_IM_MODULE",   "fcitx")
hl.env("GTK_IM_MODULE",  "fcitx")
hl.env("XMODIFIERS",     "@im=fcitx")
hl.env("SDL_IM_MODULE",  "fcitx")
hl.env("GLFW_IM_MODULE", "ibus")

hl.on("hyprland.start", function()
    hl.exec_cmd("fcitx5 -d")
end)
