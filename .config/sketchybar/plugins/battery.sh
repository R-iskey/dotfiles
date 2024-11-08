#!/bin/bash
source "$CONFIG_DIR/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

COLOR="$WHITE"
LABEL_COLOR="$WHITE"

case ${PERCENTAGE} in
  9[0-9]|100) ICON="$BATTERY_100_ICON" ;;
  [6-8][0-9]) ICON="$BATTERY_75_ICON" ;;
  [3-5][0-9]) ICON="$BATTERY_50_ICON" ;;
  [1-2][0-9]) ICON="$BATTERY_25_ICON" COLOR="$RED" LABEL_COLOR="$RED";;
  *) ICON="$BATTERY_0_ICON" COLOR="$RED" LABEL_COLOR="$RED"
esac

if [[ $CHARGING != "" ]]; then
  ICON="$BATTERY_BOLT_ICON" COLOR="$TEAL" LABEL_COLOR="$WHITE"
fi

# label="${PERCENTAGE}%"
sketchybar --set $NAME icon="$ICON" icon.color="$COLOR" label.color="$LABEL_COLOR"
