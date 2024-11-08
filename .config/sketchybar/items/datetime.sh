#!/bin/bash

TIME=(
  update_freq=10
  icon.drawing=off    
  label.padding_right=10
  label.font="$FONT:Bold:10.0"
  y_offset=-5   
  script="$PLUGIN_DIR/time.sh"
  click_script="sketchybar --set clock popup.drawing=toggle; open -a Calendar.app"
)

DATE=(
  update_freq=10
  width=0
  icon.y_offset=2
  icon.font.size=6
  icon.padding_right=10
  icon.drawing=off
  label.color=$WHITE
  label.font="$FONT:Bold:9.0"
  background.color=$TRANSPARENT
  background.padding_right=8
  y_offset=5
  script="$PLUGIN_DIR/date.sh"
  click_script="$PLUGIN_DIR/launchers/open_calendar.sh"
)

# Sound configuration
VOLUME=(
  icon.color=$WHITE
  icon.padding_left=5
  icon.padding_right=3
  icon.font="$ICON_FONT:Regular:13.0"
  label.drawing=off
  background.color=$TRANSPARENT
  background.padding_right=1
  script="$PLUGIN_DIR/sound.sh"
  click_script="$PLUGIN_DIR/sound_click.sh"
)

# Battery configuration
BATTERY=(
  update_freq=120
  icon.padding_left=3
  icon.padding_right=0
  icon.font="$ICON_FONT:Regular:15.0"
  label.drawing=off
  background.color=$TRANSPARENT
  script="$PLUGIN_DIR/battery.sh"
)

# Wifi
WIFI=(
  update_freq=30
  icon.font="$FONT:Regular:13.0"
  icon.color=$SAPPHIRE
  icon.padding_left=0
  icon.padding_right=3
  label.drawing=off
  background.color=$TRANSPARENT
  background.padding_right=1
  script="$PLUGIN_DIR/wifi.sh"
  click_script="open /System/Library/PreferencePanes/Network.prefPane"
)

DATETIME_BAR=(
  # background.color=$NORD_BG1
  background.corner_radius=5
  background.height=25
  background.padding_left=5
  background.padding_right=5
)

# Add items in right-to-left order
sketchybar --add item date right \
           --add item time right \
           --add item wifi right \
           --add item battery right \
           --add item volume right \
           --set time "${TIME[@]}" \
           --set date "${DATE[@]}" \
           --set battery "${BATTERY[@]}" \
           --set volume "${VOLUME[@]}" \
           --set wifi "${WIFI[@]}" \
           --subscribe volume volume_change \
           --subscribe battery system_woke power_source_change \
           

# Create bracket with items in left-to-right order
sketchybar --add bracket datetime date time battery volume wifi \
           --set datetime "${DATETIME_BAR[@]}" \
            # background.border_color=$NORD_BORDER \
            # background.border_width=1 