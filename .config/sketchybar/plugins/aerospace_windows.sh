#!/bin/bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/helpers.sh"


AEROSPACE_FOCUSED_MONITOR=$(aerospace list-monitors --focused | awk '{print $1}')
AEROSAPCE_WORKSPACE_FOCUSED_MONITOR=$(aerospace list-workspaces --monitor focused --empty no)
AEROSPACE_EMPTY_WORKESPACE=$(aerospace list-workspaces --monitor focused  --empty)


reload_workspace_icon() {
  current=$@


  icons="$(get_workspace_icons $current)"

  NAME="space_$current"
  
  exists="$(sketchybar --query $NAME)"
  
  if [ "${exists}" = "" ]; then
    exit 0
  fi 

  sketchybar --set $NAME label="$icons"
}

if [ "$SENDER" = "aerospace_workspace_change" ]; then
  
  AEROSPACE_FOCUSED_WORKSPACE="space_$FOCUSED_WORKSPACE"
  AEROSPACE_FOCUSED_SPACER="spacer_$FOCUSED_WORKSPACE"


  # current workspace space border color
  # sketchybar --set bracket_$FOCUSED_WORKSPACE background.border_color=$BLUE background.border_width=1

  # prev workspace space border color
  # sketchybar --set bracket_$AEROSPACE_PREV_WORKSPACE background.border_color=$TRANSPARENT background.border_width=0

  reload_workspace_icon "$AEROSPACE_PREV_WORKSPACE"
  reload_workspace_icon "$FOCUSED_WORKSPACE"

  if [ "$FOCUSED_WORKSPACE" != "" ]; then
    sketchybar --animate sin 10 --set $AEROSPACE_FOCUSED_WORKSPACE display=1
    sketchybar --animate sin 10 --set $AEROSPACE_FOCUSED_SPACER display=1
  fi
  
  for i in $AEROSAPCE_WORKSPACE_FOCUSED_MONITOR; do
    sketchybar --set $AEROSPACE_FOCUSED_WORKSPACE display=$AEROSPACE_FOCUSED_MONITOR
  done

  for i in $AEROSPACE_EMPTY_WORKESPACE; do
    if [ "$FOCUSED_WORKSPACE" != "$i" ]; then
      sketchybar --animate sin 10 --set space_$i display=0
      sketchybar --animate sin 10 --set spacer_$i display=0
    fi  
  done

  # sketchybar --set space.$AEROSPACE_FOCUSED_WORKSPACE display=$AEROSPACE_FOCUSED_MONITOR

fi