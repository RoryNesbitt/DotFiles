-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
  hl.exec_cmd('new_wall=$(find $HOME/Documents/wallpapers/* -type f | shuf -n 1) && \
              swaybg -c 000000 -o DP-1 -i "$new_wall" -o eDP-1 -i "$new_wall" &')
  hl.exec_cmd("waybar &")
  hl.exec_cmd("steam -silent &")
  hl.exec_cmd("ferdium --disable-features=WebRtcAllowInputVolumeAdjustment --disable-audio-input-processing &")
  hl.exec_cmd("easyeffects &")
end)
