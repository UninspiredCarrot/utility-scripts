#!/bin/bash

source_folder="$HOME/Downloads"
destination_folder="$HOME/Pictures"
processed_file="$HOME/code/utility-scripts/utility-script-log.txt"


process_image() {

    if ! grep -q "^$1$" "$processed_file"; then

        mv "$1" "$destination_folder/"
        echo "$1" >> "$processed_file"
    fi
}


fswatch -0 -e ".*" -i "\\.jpg$" "$source_folder" | while IFS= read -r -d '' event
do
    process_image "$event"
done &

fswatch -0 -e ".*" -i "\\.png$" "$source_folder" | while IFS= read -r -d '' event
do
    process_image "$event"
done &

fswatch -0 -e ".*" -i "\\.jpeg$" "$source_folder" | while IFS= read -r -d '' event
do
    process_image "$event"
done &

fswatch -0 -e ".*" -i "\\.webp$" "$source_folder" | while IFS= read -r -d '' event
do
    process_image "$event"
done &
