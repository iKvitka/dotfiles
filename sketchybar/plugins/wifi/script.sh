#!/bin/bash

source "$HOME/.config/sketchybar/icons.sh"

update() {
  INFO="$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs networksetup -getairportnetwork)"
  LABEL="$INFO ($(ipconfig getifaddr en0))"
  ICON="$([ -n "$INFO" ] && echo "$ICON_WIFI_CONNECTED" || echo "$ICON_WIFI_DISCONNECTED")"

  sketchybar --set wifi icon="$ICON" label="$LABEL"
}

click() {
  CURRENT_WIDTH="$(sketchybar --query wifi | jq -r .label.width)"

  WIDTH=0
  if [ "$CURRENT_WIDTH" -eq "0" ]; then
    WIDTH=dynamic
  fi

  sketchybar --animate sin 20 --set wifi label.width="$WIDTH"
}

update

echo "$WIFI_CONNECTED" 

case "$SENDER" in
  "wifi_change") update
  ;;
  "mouse.clicked") click
  ;;
esac
