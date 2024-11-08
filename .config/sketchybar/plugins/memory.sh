#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

# Calculate the used memory percentage
used_memory_percentage=$(memory_pressure | awk '/^System-wide memory free percentage: /{ printf("%d\n", $5) }')

if [ -z "$used_memory_percentage" ]; then
  used_memory_percentage=0  # Default to 0 if not found
fi

# Set the color based on percentage remaining
if [ "$used_memory_percentage" -gt 90 ]; then
  COLOR=$NORD_DANGER   # more than 80
elif [ "$used_memory_percentage" -gt 70 ]; then
  COLOR=$NORD_WARNING
else
  COLOR=$WHITE  # More than 50% remaining
fi


# Set the label in SketchyBar
sketchybar --set $NAME label="${used_memory_percentage}%" label.color="$COLOR"