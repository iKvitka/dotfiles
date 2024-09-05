#!/usr/bin/env bash

source "$HOME/.config/sketchybar/icons.sh"

CHARGE=$(pmset -g batt | awk '/%/{ print $3 }' | { read -r charge; echo "${charge%??}"; })

# Change to range based icon selection
GRADUATION_SCALE=$((100 / ${#ICONS_BATTERY[@]}))
BATTERY_ICON_INDEX=$((CHARGE / GRADUATION_SCALE))

BATTERY_ICON=${ICONS_BATTERY[$((BATTERY_ICON_INDEX))]}

battery_property=(
  label="$CHARGE%"
  icon="$BATTERY_ICON"
)

sketchybar --set $NAME "${battery_property[@]}"
