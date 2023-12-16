#!/bin/bash


processed_file="/Users/bolt/code/utility-scripts/logs/processed_text.txt"
fswatch -0 -e ".*" -i "\\.docx$" "$HOME/Downloads" | while IFS= read -r -d '' event
do
    if [[ "$event" =~ /[^/]+\.docx$ && ! "$event" =~ /[^/]+\.download/ ]]; then

        if ! grep -q "^$event$" "$processed_file"; then

            unoconv -f pdf "$event"
            mv ~/Downloads/*.pdf ~/Documents/
            mv "$event" ~/Documents/word/
            echo "$event" >> "$processed_file"
        fi
    fi
done

