#!/bin/bash

if [ "$FOCUSED_WORKSPACE" = "" ]; then
    FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
fi

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" icon.highlight=on \
        label.highlight=on \
        display=1

    # sketchybar --set spacer_$1 background.color=$NORD_BG1
else
    sketchybar --set "$NAME" icon.highlight=off \
        label.highlight=off

    # sketchybar --set bracket_$1 background.border_color=$NORD_BORDER
fi 

