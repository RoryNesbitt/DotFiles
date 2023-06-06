#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown
for m in $(polybar --list-monitors | grep primary | cut -d":" -f1); do
  MONITOR=$m polybar --reload main &
  echo $m
done
for m in $(polybar --list-monitors | grep -v primary | cut -d":" -f1); do
  echo $m
  MONITOR=$m polybar --reload side &
done

echo "Bars launched..."
