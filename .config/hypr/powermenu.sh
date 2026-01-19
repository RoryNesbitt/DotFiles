#!/usr/bin/env sh
rofi_command="rofi -dmenu -i -theme $HOME/.config/rofi/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

shutdown="    Shutdown"
reboot="    Reboot"
lock="    Lock"
suspend="    Suspend"
logout="    Logout"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Online For:  ${uptime}" -dmenu -selected-row 0)"
case $chosen in
  $shutdown)
    systemctl poweroff
    ;;		
  $reboot)
    systemctl reboot
    ;;
  $lock)
    hyprlock
    ;;
  $suspend)
    systemctl suspend
    ;;
  $logout)
    hyprctl dispatch exit 0
    ;;
esac
