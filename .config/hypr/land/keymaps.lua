-------------------
--- KEYBINDINGS ---
-------------------

-- Reload waybar
hl.bind("SUPER + SHIFT + R", function()
  hl.dispatch(hl.dsp.exec_cmd("killall waybar"))
  hl.dispatch(hl.dsp.exec_cmd("waybar &"))
end)

-- Open things on their workspace
-- Terminal
hl.bind("SUPER + Return", function()
  hl.dispatch(hl.dsp.focus({ workspace = 1 }))
  hl.dispatch(hl.dsp.exec_cmd(terminal))
end)
hl.bind("SUPER + SHIFT + Return", hl.dsp.exec_cmd(terminal))

-- Browser
hl.bind("SUPER + W", function()
  hl.dispatch(hl.dsp.focus({ workspace = 2 }))
  hl.dispatch(hl.dsp.exec_cmd(browser))
end)
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd(browser))

-- Ferdium
hl.bind("SUPER + M", function()
  hl.dispatch(hl.dsp.focus({ workspace = 3 }))
  hl.dispatch(hl.dsp.exec_cmd("ferdium"))
end)
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("ferdium"))

-- Environment management
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("bash $HOME/.config/hypr/powermenu.sh"))
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
-- hl.bind("SUPER + V",             hl.dsp.layout.toggle_split())
-- hl.bind("SUPER + left",          hl.dsp.layout.toggle_split())

-- Move focus with mainMod + vim keys
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))

-- Move windows with mainMod + SHIFT + vim keys
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

for i = 1, 9 do
  -- Switch workspaces with mainMod + [0-9]
  hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
  hl.bind("SUPER + CTRL + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind("SUPER + CTRL + 0", hl.dsp.window.move({ workspace = 10, silent = true }))

-- Special workspace (scratchpad)
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

-- Move/resize windows with mainMod + LMB/RMB
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("hyprshot -m window -m active --clipboard-only"))

-- Volume (laptop multimedia keys)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Media keys (requires playerctl)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
