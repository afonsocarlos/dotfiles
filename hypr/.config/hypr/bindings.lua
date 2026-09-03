-- Personal keybinding overrides migrated from bindings.conf.
-- See current bindings and descriptions:
--   omarchy menu keybindings --print

function rebind(key, description, command)
  hl.unbind(key)
  o.bind(key, description, command)
end

-- Application bindings
rebind("SUPER + F", "File manager", "uwsm-app -- nautilus --new-window")
rebind("SUPER + ALT + CTRL + F", "File manager (cwd)", [[uwsm-app -- nautilus --new-window "$(omarchy-cmd-terminal-cwd)"]])
rebind("SUPER + B", "Browser", "omarchy-launch-browser")
rebind("SUPER + SHIFT + B", "Browser (private)", "omarchy-launch-browser --private")
rebind("SUPER + N", "Editor", "omarchy-launch-editor")
rebind("SUPER + D", "Docker", "omarchy-launch-tui lazydocker")
rebind("SUPER + G", "Telegram", [[omarchy-launch-or-focus ^telegram$ "uwsm-app -- Telegram"]])
rebind("SUPER + SHIFT + O", "Obsidian", [[omarchy-launch-or-focus ^obsidian$ "uwsm-app -- obsidian"]])
rebind("SUPER + SHIFT + W", "Typora", "uwsm-app -- typora --enable-wayland-ime")
rebind("SUPER + K", "Passwords", "uwsm-app -- keepassxc")

-- If your web app url contains #, type it as ## to prevent hyprland treating it as a comment
rebind("SUPER + A", "ChatGPT", [[omarchy-launch-webapp "https://chatgpt.com"]])
rebind("SUPER + SHIFT + A", "Gemini", [[omarchy-launch-webapp "https://gemini.google.com"]])
rebind("SUPER + M", "Music", [[omarchy-launch-webapp "https://music.youtube.com/"]])
rebind("SUPER + Y", "YouTube", [[omarchy-launch-webapp "https://youtube.com/"]])
rebind("SUPER + SHIFT + G", "WhatsApp", [[omarchy-launch-or-focus-webapp WhatsApp "https://web.whatsapp.com/"]])
rebind("SUPER + P", "Google Photos", [[omarchy-launch-or-focus-webapp "Google Photos" "https://photos.google.com/"]])
rebind("SUPER + SHIFT + X", "X", [[omarchy-launch-webapp "https://x.com/"]])
rebind("SUPER + ALT + SHIFT + X", "X Post", [[omarchy-launch-webapp "https://x.com/compose/post"]])

-- Omarchy overrides
-- Move close window from SUPER + W to SUPER + Q
-- SUPER + W was previously: Close window
hl.unbind("SUPER + W")
rebind("SUPER + Q", "Close window", hl.dsp.window.close())

-- Show help menu
rebind("SUPER + H", "Show key bindings", "omarchy-menu-keybindings")

-- Flameshot
-- rebind("PRINT", "Screenshot", "flameshot gui")

-- Lock screen
rebind("SUPER + ESCAPE", "Lock system", "omarchy-lock-screen")

-- Lock screen menu
rebind("SUPER + CTRL + L", "Lock system", "omarchy-menu system")

-- Overwrite existing bindings, like putting Omarchy Menu on Super + Space
-- rebind("SUPER + SPACE", "Omarchy menu", "omarchy-menu")
