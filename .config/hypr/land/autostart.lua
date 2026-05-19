-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
  -- Set a random wallpaper via hyprpaper template
  local home = os.getenv("HOME")
  local new_wall = io.popen(string.format("find %s/Documents/wallpapers/* -type f | shuf -n 1", home)):read("*l")
  os.execute(string.format(
    "sed -e 's~<wp>~%s~g' %s/.config/hypr/paper/template.conf > %s/.config/hypr/hyprpaper.conf",
    new_wall, home, home
  ))

  hl.exec_cmd("waybar &")
  hl.exec_cmd("hyprpaper &")
  hl.exec_cmd("steam -silent &")
  hl.exec_cmd("ferdium &")
end)
