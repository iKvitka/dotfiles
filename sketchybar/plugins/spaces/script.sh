#!/bin/bash

update() {
  source "$HOME/.config/sketchybar/icons.sh"

  sketchybar --set $NAME background.drawing=$SELECTED \
  	icon.highlight=$SELECTED \
  	label.highlight=$SELECTED

  for i in "${!ICONS_SPACE[@]}"
  do
    sid=$(($i+1))
    LABEL=""

    QUERY=$(yabai -m query --windows --space $sid)
    APPS=$(echo "$QUERY" | jq '.[].app')
    TITLES=$(echo "$QUERY" | jq '.[].title')

    if grep -q "\"" <<< $APPS;
    then
      APPS_ARR=()
      while read -r line; do APPS_ARR+=("$line"); done <<< "$APPS"
      TITLES_ARR=()
      while read -r line; do TITLES_ARR+=("$line"); done <<< "$TITLES"

      LENGTH=${#APPS_ARR[@]}
      for j in "${!APPS_ARR[@]}"
      do
        APP=$(echo ${APPS_ARR[j]} | sed 's/"//g')
        TITLE=$(echo ${TITLES_ARR[j]} | sed 's/"//g')

        ICON=$($HOME/.config/sketchybar/plugins/spaces/application_icons.sh "$APP" "$TITLE")
        LABEL+="$ICON"
        if [[ $j -lt $(($LENGTH-1)) ]]; then
          LABEL+=" "
        fi
      done
    else
      LABEL+="_"
    fi

    sketchybar --set space.$sid label="$LABEL"
  done
}


mouse_clicked() {
  if [ "$BUTTON" = "left" ]; then
      yabai -m space --focus $SID
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac