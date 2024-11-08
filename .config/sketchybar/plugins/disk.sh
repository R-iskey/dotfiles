#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

# Calculate available and used space as integer percentages (rounded down)
available_percentage=$(df / | awk 'NR==2 {printf "%d", ($4 / $2) * 100}')
used_percentage=$((100 - available_percentage))

if [ "$used_percentage" -gt 90 ]; then
  COLOR=$NORD_DANGER   
elif [ "$used_percentage" -gt 70 ]; then
  COLOR=$NORD_WARNING 
else
  COLOR=$WHITE 
fi

# Set the label with formatted free space and icon color
sketchybar --set $NAME label="$used_percentage%" label.color="$COLOR"
