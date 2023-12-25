#!/bin/bash

source_folder="$HOME/Downloads"
destination_folder="$HOME/Documents"
processed_file="$HOME/code/utility-scripts/utility-script-log.txt"


process_doc() {

    if ! grep -q "^$1$" "$processed_file"; then

        mv "$1" "$destination_folder/"
        echo "$1" >> "$processed_file"
    fi
}


fswatch -0 -e ".*" -i "\\.pdf$" "$source_folder" | while IFS= read -r -d '' event
do
    process_doc "$event"
done &

fswatch -0 -e ".*" -i "\\.csv$" "$source_folder" | while IFS= read -r -d '' event
do
    process_doc "$event"
done &
