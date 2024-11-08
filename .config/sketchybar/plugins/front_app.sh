#!/bin/bash

source "$HOME/.config/sketchybar/plugins/icon_map_fn.sh"

# Get the frontmost application name using Aerospace
front_app=$(aerospace list-windows --focused --format "%{app-name}")

# Get the icon for the current frontmost application
icon=$(icon_map "$front_app")

# Update SketchyBar or fallback
if [ -n "$front_app" ]; then
  sketchybar --set $NAME label="$front_app" icon="$icon"
else
  sketchybar --set $NAME display=0
fi