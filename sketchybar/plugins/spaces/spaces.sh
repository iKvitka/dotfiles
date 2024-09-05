#!/bin/bash

sketchybar --add event window_changed

export ICONS_SPACE=("󰎤" "󰎧" "󰎪" "󰎭" "󰎱" "󰎳" "󰎶" "󰎹" "󰎼" "󰎡")

COLORS_SPACE=("$COLOR_YELLOW" "$COLOR_CYAN" "$COLOR_MAGENTA" "$COLOR_WHITE" "$COLOR_BLUE" "$COLOR_RED" "$COLOR_GREEN" 0xe0fde38d "$COLOR_PURPLE" 0xe00088CC)
LENGTH=${#ICONS_SPACE[@]}


for i in "${!ICONS_SPACE[@]}"
do
  sid=$((i+1))
  PAD_LEFT=2
  PAD_RIGHT=2
  if [[ $i == 0 ]]; then
    PAD_LEFT=8
  elif [[ $i == $((LENGTH-1)) ]]; then
    PAD_RIGHT=8
  fi
  sketchybar --add space space.$sid left                                        \
             --set       space.$sid script="$PLUGIN_DIR/spaces/script.sh"       \
                                    associated_space=$sid                       \
                                    padding_left=$PAD_LEFT                      \
                                    padding_right=$PAD_RIGHT                    \
                                    background.color="${COLORS_SPACE[i]}"       \
                                    background.border_width=0                   \
                                    background.corner_radius=6                  \
                                    background.height=24                        \
                                    icon="${ICONS_SPACE[i]}"                    \
                                    icon.color="${COLORS_SPACE[i]}"             \
                                    icon.font="$FONT:Bold:24.0"                 \
                                    label="_"                                   \
                                    label.color="${COLORS_SPACE[i]}"            \
                                    label.font="$FONT:Bold:24.0"                \
             --subscribe space.$sid mouse.clicked
done

sketchybar --add bracket spaces '/space\..*/'                      \
           --set         spaces background.color=$COLOR_BACKGROUND

sketchybar --add item seperator.l2 left                   \
           --set      seperator.l2 padding_left=4         \
                                   padding_right=4        \
                                   background.drawing=off \
                                   icon.drawing=off       \
                                   label.drawing=off