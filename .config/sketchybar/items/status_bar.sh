#!/bin/bash

# Sound configuration
VOLUME=(
  icon.color=$WHITE
  icon.padding_left=3
  icon.padding_right=3
  # icon.y_offset=1
  icon.font="$ICON_FONT:Regular:13.0"
  label.drawing=off
  background.color=$TRANSPARENT
  script="$PLUGIN_DIR/sound.sh"
  click_script="$PLUGIN_DIR/sound_click.sh"
)

# Battery configuration
BATTERY=(
  update_freq=120
  icon.padding_left=0
  icon.padding_right=0
  # icon.y_offset=1
  icon.font="$ICON_FONT:Regular:15.0"
  label.drawing=off
  background.color=$TRANSPARENT
  script="$PLUGIN_DIR/battery.sh"
)

# Wifi
WIFI=(
  update_freq=30
  icon.font="$FONT:Regular:13.0"
  icon.color=$WHITE
  icon.padding_left=0
  icon.padding_right=5
  # icon.y_offset=1
  label.drawing=off
  background.color=$TRANSPARENT
  script="$PLUGIN_DIR/wifi.sh"
  click_script="open /System/Library/PreferencePanes/Network.prefPane"
)

STATUS_BAR=(
  background.color=$BG_PRI_COLR_BLUR_OVERLAY
  background.corner_radius=5
  background.height=25
  background.padding_left=5
  background.padding_right=5
  background.border_color=$BG_PRI_COLR_BLUR_BORDER
  background.border_width=1
)

# Add items in right-to-left order
sketchybar --add item spacer_status right \
           --add item wifi right \
           --add item battery right \
           --add item volume right \
           --set battery "${BATTERY[@]}" \
           --set volume "${VOLUME[@]}" \
           --set wifi "${WIFI[@]}" \
           --set spacer_status background.drawing=off \
           width=10 \
           --subscribe volume volume_change \
           --subscribe battery system_woke power_source_change \
           

sketchybar --add bracket status_bar wifi battery volume \
           --set status_bar "${STATUS_BAR[@]}" 