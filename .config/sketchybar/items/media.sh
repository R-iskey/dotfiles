#!/bin/bash

media=(
    script="$PLUGIN_DIR/media.sh"
    updates=on
    drawing=off
    label="No Media Playing"
    background.color=$BG_PRI_COLR_BLUR_OVERLAY
    background.border_width=1
    background.border_color=$TEAL_BLUR
    background.corner_radius=5
    background.height=25
    background.padding_left=5
    background.padding_right=5
    label.font.size=12
    # label.padding_right=10
    icon.font="$ICON_FONT:Regular:12.0"
    padding_right=80
    width=180          # Add fixed width
    label.width=80    # Add fixed label width
    icon.width=20      # Add fixed icon width
    label.color=$TEAL
    icon.color=$TEAL
    align=left         # Ensure left alignment
)

sketchybar --add item media right \
           --set media "${media[@]}" \
           --subscribe media media_change