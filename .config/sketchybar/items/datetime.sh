#!/bin/bash

TIME=(
  update_freq=10
  icon.drawing=off    
  label.padding_right=8
  label.padding_left=0
  label.font="$FONT:Bold:10.0"
  label.color=$WHITE
  # background.color=$RED
  y_offset=-8   
  script="$PLUGIN_DIR/time.sh"
  click_script="sketchybar --set clock popup.drawing=toggle; open -a Calendar.app"
)

DATE=(
  update_freq=10
  width=0
  icon.drawing=off
  label.color=$WHITE
  label.font="$FONT:Bold:10.0"
  background.color=$TRANSPARENT
  background.padding_right=8
  y_offset=5
  script="$PLUGIN_DIR/date.sh"
  click_script="$PLUGIN_DIR/scripts/open-calendar.sh"

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
           --set time "${TIME[@]}" \
           --set date "${DATE[@]}"
           

# Create bracket with items in left-to-right order
# sketchybar --add bracket datetime date time \
#            --set datetime "${DATETIME_BAR[@]}"