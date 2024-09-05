#!/bin/bash

current_date=(
  icon=date
	icon.font="$FONT:Bold:13.0"
	icon.align=right
	icon.padding_right=0
	width=120
	y_offset=-7
	update_freq=120
	script="$PLUGIN_DIR/calendar/current_date.sh"
)

current_time=(
  icon=current_time
  icon.font="$FONT:Bold:13.0"
  icon.align=right
  icon.padding_right=0
	background.padding_right=-112
  update_freq=1
  y_offset=7
  script="$PLUGIN_DIR/calendar/current_time.sh"
)

ist_time=(
  icon=ist_time
  icon.font="$FONT:Bold:13.0"
  icon.align=right
  icon.y_offset=7
  label=IST
  label.y_offset=-7
  label.padding_left=-33
  update_freq=1
  script="$PLUGIN_DIR/calendar/ist_time.sh"
)

utc_time=(
  icon=utc_time
  icon.font="$FONT:Bold:13.0"
  icon.align=right
  icon.y_offset=7
  label=UTC
  label.y_offset=-7
  label.padding_left=-33
  update_freq=1
  script="$PLUGIN_DIR/calendar/utc_time.sh"
)

sketchybar 	--add item calendar.date right 						        \
						--set calendar.date "${current_date[@]}" 	        \
						--subscribe calendar.date system_woke             \
						                                                  \
						--add item calendar.time.current right            \
						--set calendar.time.current "${current_time[@]}"  \
						--subscribe calendar.time.current system_woke     \
						                                                  \
						--add item calendar.time.ist right                \
            --set calendar.time.ist "${ist_time[@]}"          \
            --subscribe calendar.time.ist system_woke         \
                                                              \
            --add item calendar.time.utc right                \
            --set calendar.time.utc "${utc_time[@]}"          \
            --subscribe calendar.time.utc system_woke
