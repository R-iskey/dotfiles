#!/bin/bash


# Source required configuration files
source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"
source "$HOME/.config/sketchybar/helpers.sh"

# M = Media/Messsanger, W = Work
declare -a MAX_WORKSPACES=("1" "2" "3" "4" "5" "6" "7")
# declare -a WORKSPACE_COLORS=(
#   ["1"]="$MAUVE" 
#   ["2"]="$SKY" 
#   ["3"]="$SAPPHIRE" 
#   ["4"]="$LAVENDER" 
#   ["5"]="$ROSEWATER" 
#   ["M"]="$YELLOW" 
#   ["W"]="$BLUE"
# )

sketchybar --add event aerospace_workspace_change

# Add padding to the left
sketchybar --add item spacer left \
  --set spacer icon.drawing=off label.drawing=off background.drawing=off padding_left=6 padding_right=0

SPACE_BAR=(
  # background.color=$NORD_BG1
  background.corner_radius=5
  background.height=25
  # background.padding_left=10
  # background.padding_right=10
)

# Loop to set up each workspace
for m in $(aerospace list-monitors | awk '{print $1}'); do
  for i in $(aerospace list-workspaces --monitor $m); do
    sid="$i"
    icon_name="WORKSPACE_${sid}"
    name="space_$sid"
    bracket="bracket_$sid"

    space=(
        space="$sid"
        associated_display="$m"
        icon="${sid} |"
        display=1
        icon.font.size=12
        icon.padding_left=1
        icon.padding_right=5
        icon.highlight_color=$WHITE 
        icon.color=$DARK_WHITE
        label.color=$DARK_WHITE
        label.padding_right=5
        label.padding_left=1
        label.font="sketchybar-app-font:Regular:11.0" 
        label.highlight_color=$WHITE
        label.y_offset=0
        click_script="aerospace workspace $sid" 
        script="$PLUGIN_DIR/aerospace.sh $sid"
      )

      # spacer
      sketchybar --add item spacer_$sid left \
                 --set spacer_$sid background.drawing=off width=5

      sketchybar --add space "$name" left \
                 --set "$name" "${space[@]}" \
                 --subscribe "$name" mouse.clicked aerospace_workspace_change

      # bracket 
      sketchybar --add bracket "$bracket" "$name" \
                 --set "$bracket" "${SPACE_BAR[@]}" \
                #  background.border_color=$NORD_BORDER \
                #  background.border_width=1           

      # Add the workspace name to the array
      WORKSPACE_NAMES+=("$name")

      icon_strip="$(get_workspace_icons $sid)"

      sketchybar --set $name label="$icon_strip"
  done

  # Hide empty tabs
  for i in $(aerospace list-workspaces --monitor $m --empty); do
    sketchybar --set space_$i display=0
    sketchybar --set spacer_$i display=0
  done

done

SPACE_CREATOR=(
  icon=􀆊
  padding_left=0
  padding_right=0
  display=active
  icon.color=$WHITE
  icon.font.size=11
  label.drawing=off
  y_offset=1
  script="$PLUGIN_DIR/aerospace_windows.sh"
)

sketchybar --add item space_creator left \
           --set space_creator "${SPACE_CREATOR[@]}"   \
           --subscribe space_creator aerospace_workspace_change