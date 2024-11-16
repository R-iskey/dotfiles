#!/bin/bash

# Ensure proper handling of UTF-8 characters
export LC_ALL=en_US.UTF-8

# Function to format the message
fmt_msg() {
    local msg="$1"
    local length="$2"
    local msg_length="${#msg}"
    if [ "$msg_length" -gt "$length" ]; then
        # Truncate the message and add an ellipsis
        printf -v result "%.*s…" "$((length - 1))" "$msg"
    else
        # Left-align the message with spaces
        printf -v result "%-${length}s" "$msg"
    fi
    echo "$result"
}

# Function to kill duplicate processes
kill_dupes() {
    local proc_str="$1"
    local current_process=$$

    pgrep -f "$proc_str" | grep -v "^$current_process\$" | xargs -r kill -TERM
}

# Function to get media info from the INFO environment variable
get_media_info() {
    echo "$INFO"
}

# Function to determine the icon based on the app name
determine_icon() {
    local app_name="$1"
    local normalized_app_name
    local icon
    normalized_app_name=$(echo "$app_name" | tr -d ' ' | tr '[:upper:]' '[:lower:]')

    case "$normalized_app_name" in
        "music")
            icon=""  # Apple Music icon
            ;;
        "safari")
            icon="󰖟"  # Safari icon (YouTube)
            ;;
        "chrome")
            icon="󰊯"  # Chrome icon
            ;;
        "firefox")
            icon="󰈹"  # Firefox icon
            ;;
        "arc")
            icon="󰑈"  # Arc icon
            ;;
        *yandex*)
            icon="󰋋"  # Yandex Music icon
            ;;
        *)
            icon="󰲑"  # Default icon
            ;;
    esac
    echo "$icon"
}

# Main function
main() {
    local FIXED_WIDTH=20   # Adjust the width as needed
    
    sleep 1

    # Ensure only one instance of the script is running
    # kill_dupes "/sketchybar/plugins/media.sh"

    local media_info
    media_info=$(get_media_info)

    if [ -z "$media_info" ]; then
        exit 0
    fi

    local state
    state=$(echo "$media_info" | jq -r '.state')
    
    echo $state

    if [ "$state" != "playing" ] && [ "$state" != "paused" ]; then
        exit 0
    fi

    local title
    local artist
    local now_playing

    title=$(echo "$media_info" | jq -r '.title')
    artist=$(echo "$media_info" | jq -r '.artist')
    now_playing="$title - $artist"

    local app_name
    app_name=$(echo "$media_info" | jq -r '.app // "Unknown"')

    local icon
    icon=$(determine_icon "$app_name")

    local display
    display=$(fmt_msg "$now_playing" "$FIXED_WIDTH")

    local drawing="off"

    if [[ -n "$artist" && -n "$title" ]]; then
        drawing="on"
    else
        echo "Artist or Title is missing."
    fi
    # Send the formatted label to SketchyBar
    sketchybar --set "$NAME" "icon=$icon" "drawing=$drawing" "label=$display"
}

# Execute the main function
main