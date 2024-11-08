#!/bin/bash

media=(
    script="$PLUGIN_DIR/media.sh"
    updates=on
    drawing=off
    label="No Media Playing"
    background.color=$TRANSPARENT
    background.border_width=1
    background.border_color=$NORD_BORDER
    background.corner_radius=5
    background.height=25
    background.padding_left=5
    background.padding_right=5
    label.font.size=12
    icon.font="$ICON_FONT:Regular:12.0"
    padding_right=80
    width=150          # Add fixed width
    label.width=80    # Add fixed label width
    icon.width=20      # Add fixed icon width
    label.color=$LAVENDER
    icon.color=$LAVENDER
    align=left         # Ensure left alignment
)

sketchybar --add item media right \
           --set media "${media[@]}" \
           --subscribe media media_change