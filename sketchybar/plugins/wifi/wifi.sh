#!/bin/bash

source "$SKETCHYBAR_CONFIG_DIR/icons.sh"

wifi=(
  padding_right=7
  label.width=0
  icon="$ICON_WIFI_DISCONNECTED"
  icon.font="$FONT:Bold:24.0"
  script="$PLUGIN_DIR/wifi/script.sh"
)

sketchybar --add item wifi right \
           --set wifi "${wifi[@]}" \
           --subscribe wifi wifi_change mouse.clicked
