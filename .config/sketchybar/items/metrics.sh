#!/bin/bash

# Disk configuration
DISK=(
  update_freq=60
  label.padding_left=1
  label.padding_right=3
  y_offset=-4
  background.color=$TRANSPARENT
  icon.padding_left=0
  script="$PLUGIN_DIR/disk.sh"
)

DISK_LABEL=(
label="SSD"
label.font="$FONT:SemiBold:7.0"
y_offset=5
width=0
)

# Memory configuration
MEMORY=(
update_freq=3
label.padding_left=1
label.padding_right=3
icon.padding_left=0
background.color=$TRANSPARENT
y_offset=-4
script="$PLUGIN_DIR/memory.sh"
)

MEMORY_LABEL=(
label="MEM"
label.font="$FONT:SemiBold:7.0"
y_offset=5
width=0
)

# CPU configuration
CPU=(
update_freq=3
label.padding_left=1
label.padding_right=1
icon.padding_left=0
background.color=$TRANSPARENT
y_offset=-4
script="$PLUGIN_DIR/cpu.sh"
)

CPU_LABEL=(
label="CPU"
label.font="$FONT:SemiBold:7.0"
y_offset=5
width=0
)

# Network
NETWORK_UP=(
label.font="$FONT:SemiBold:8.0"
icon.font="$ICON_FONT:Bold:7.0"
icon=$ARROW_UP
icon.highlight_color=$GREEN
icon.padding_left=5
y_offset=5
width=0
update_freq=1
script="$PLUGIN_DIR/network.sh"
)

NETWORK_DOWN=(
label.font="$FONT:SemiBold:8.0"
icon.font="$ICON_FONT:Bold:7.0"
icon.padding_left=5
icon=$ARROW_DOWN
icon.highlight_color=$RED
y_offset=-4
width=0
update_freq=1
)

# Add all items first
sketchybar --add item spacer_metrics right \
--add item disk_label right \
--add item disk right \
--add item memory_label right \
--add item memory right \
--add item cpu_label right \
--add item cpu right \
--add item network_up right \
--add item network_down right \
--set memory "${MEMORY[@]}" \
--set cpu "${CPU[@]}" \
--set disk "${DISK[@]}" \
--set cpu_label "${CPU_LABEL[@]}" \
--set memory_label "${MEMORY_LABEL[@]}" \
--set disk_label "${DISK_LABEL[@]}" \
--set network_up "${NETWORK_UP[@]}" \
--set network_down "${NETWORK_DOWN[@]}" \
--set spacer_metrics background.drawing=off \
  width=10

# Create the bracket with metrics items
sketchybar --add bracket metrics memory cpu disk network_up network_down \
  # --set metrics background.color=$NORD_BG1 \
    # background.corner_radius=5 \
    # background.height=25 \
    # background.padding_left=5 \
    # background.padding_right=5
