#!/bin/bash
source "$CONFIG_DIR/colors.sh"


CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)
CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")

CPU_PERCENT="$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')"

# Set the color based on percentage remaining
if [ "$CPU_PERCENT" -gt 80 ]; then
  COLOR=$NORD_DANGER   # more than 80
elif [ "$CPU_PERCENT" -gt 60 ]; then
  COLOR=$NORD_WARNING
else
  COLOR=$WHITE  # More than 50% remaining
fi

sketchybar --set $NAME label="$CPU_PERCENT%" label.color="$COLOR"