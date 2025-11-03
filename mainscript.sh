#!/bin/bash

while true; do
  wmctrl -l | while read -r line; do
    win_id=$(echo "$line" | awk '{print $1}')
    title=$(echo "$line" | cut -d ' ' -f 5-)

    if [[ "$title" == *Ubuntu* ]]; then
      new_title=$(echo "$title" | sed 's/Ubuntu/E! OS/g')
      wmctrl -i -r "$win_id" -N "$new_title"
    fi
  done
  sleep 0.01
done
