#!/bin/bash


processed_file="/Users/bolt/code/utility-scripts/utility-script-log.txt"
fswatch -0 -e ".*" -i "\\.docx$" "$HOME/Downloads" | while IFS= read -r -d '' event
do
    if [[ "$event" =~ /[^/]+\.docx$ && ! "$event" =~ /[^/]+\.download/ ]]; then

        if ! grep -q "^$event$" "$processed_file"; then
            unoconv -f pdf "$event"
            echo "converted $event to pdf" >> "$processed_file"
            mv $event ~/Documents/ms-office/docx/
        fi
    fi
done

