# #!/bin/bash

WEATHER=(
  update_freq=120
  icon.font="$ICON_FONT:Regular:10.0"
  icon.color=$WHITE
  icon.padding_left=0
  icon.padding_right=0
  icon.y_offset=-8
  icon.width=0
  label.color=$WHITE
  label.padding_left=1
  label.padding_right=0
  label.font.size=13
  label.y_offset=6
  # background.color=$OVERLAY
  # background.corner_radius=5
  script="$PLUGIN_DIR/weather.sh"
)

WEATHER_BAR=(
  # background.color=$OVERLAY
  background.corner_radius=5
  background.height=25
)

sketchybar --add item weather right \
           --set weather "${WEATHER[@]}" 
         
sketchybar --add bracket weather_bar weather \
      --set weather_bar "${WEATHER_BAR[@]}" \
      # background.border_color=$DARK_WHITE \
      # background.border_width=1