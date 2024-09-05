#!/bin/bash

MAX_SPACES=${MAX_SPACES:-10}

space_counter=`yabai -m query --spaces | jq length`

while [ $space_counter -lt $MAX_SPACES ]
do
	yabai -m space --create

	((space_counter++))
	echo 'Created space ' $space_counter	
done
