# #!/bin/bash

WEATHER=(
  update_freq=120
  icon.font="$ICON_FONT:Regular:13.0"
  icon.color=$WHITE
  icon.padding_left=3
  icon.padding_right=5
  label.y_offset=-1
  # icon.width=0
  label.color=$WHITE
  label.padding_left=0
  label.padding_right=5
  label.font.size=12
  # label.y_offset=-2
  # background.color=$OVERLAY
  # background.corner_radius=5
  script="$PLUGIN_DIR/weather.sh"
)

WEATHER_BAR=(
  background.color=$BG_PRI_COLR_BLUR_OVERLAY
  background.corner_radius=5
  background.height=25
  background.border_color=$BG_PRI_COLR_BLUR_BORDER
  background.border_width=1
)

sketchybar --add item weather_spacer right \
           --add item weather right \
           --set weather "${WEATHER[@]}" \
           --set weather_spacer background.drawing=off width=20

sketchybar --add bracket weather_bar weather right \
      --set weather_bar "${WEATHER_BAR[@]}" 