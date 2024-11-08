#!/bin/bash
source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/colors.sh"

wifi_status=$(networksetup -getairportpower en0 | grep -o "On")
connection_name=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}')

ICON=""
COLOR=$WHITE

if [ "$wifi_status" == "On" ]; then
    ICON="$NET_WIFI"
else
    ICON="$NET_OFF"
    COLOR="$RED"
fi

# Make sure $NAME is set to the item name you want to update in SketchyBar
sketchybar --set "$NAME" icon="$ICON" icon.color="$COLOR"
#label="${connection_name}"
