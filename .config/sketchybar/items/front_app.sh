#!/bin/bash

# Front app configuration
FRONT_APP=(
  label.font="$FONT:SemiBold:12.0"
  icon.font="sketchybar-app-font:Regular:12.0"
  icon.color=$BLUE
  icon.padding_left=10
  label.padding_right=10
  label.color=$WHITE
  background.color=$NORD_BG1
  background.corner_radius=5
  background.height=25
  padding_left=8
  padding_right=10
  script="$PLUGIN_DIR/front_app.sh"
)

# Add the front_app item
sketchybar --animate elastic 15 \
        --add item front_app left \
        --set front_app "${FRONT_APP[@]}" \
        --subscribe front_app front_app_switched