source "$HOME/.config/sketchybar/plugins/icon_map_fn.sh"

get_workspace_icons() {
  workspace=$1

  apps=$(aerospace list-windows --workspace "$workspace" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

  icon_strip=""
  if [ "${apps}" != "" ]; then
    while read -r app
    do
        icon_strip+=" $(icon_map "$app") "
    done <<< "${apps}"
  else
    icon_strip="-"
  fi

  echo "$icon_strip"
}
