# #!/bin/bash

WEATHER=(
  update_freq=120
  icon.font="$ICON_FONT:Regular:12.0"
  icon.color=$GREEN
  icon.padding_left=3
  icon.padding_right=0
  icon.y_offset=-1
  # icon.width=0
  label.color=$GREEN
  label.padding_left=3
  label.padding_right=3
  label.font.size=10
  # label.y_offset=-3
  background.color=$TRANSPARENT
  script="$PLUGIN_DIR/weather.sh"
)

BATTERY_VOLUME_BAR=(
  background.color=$NORD_BG1
  background.corner_radius=5
  background.height=25
  background.padding_left=5
  background.padding_right=5
)

sketchybar --add item spacer_datetime right \
           --add item weather right \
           --set weather "${WEATHER[@]}" \
           --set spacer_datetime background.drawing=off \
            width=5
         

sketchybar --add bracket weather_bar weather \
           --set weather_bar "${BATTERY_VOLUME_BAR[@]}" \
          background.border_color=$NORD_BORDER \
          background.border_width=1
