#!/usr/bin/env bash

source "$SKETCHYBAR_CONFIG_DIR/icons.sh"

battery_charge=(
  icon="${ICONS_BATTERY[${#ICONS_BATTERY[@]} - 1]}"
	icon.font="$FONT:Bold:20.0"
	icon.align=right
	icon.padding_right=2
	width=62
	y_offset=0
	update_freq=10
	label="100%"
	script="$PLUGIN_DIR/battery/charge.sh"
)

sketchybar 	--add item battery right 						          \
						--set battery "${battery_charge[@]}" 	        \
						--subscribe battery system_woke