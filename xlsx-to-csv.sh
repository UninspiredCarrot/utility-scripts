#!/bin/bash


processed_file="/Users/bolt/code/utility-scripts/utility-script-log.txt"
fswatch -0 -e ".*" -i "\\.xlsx$" "$HOME/Downloads" | while IFS= read -r -d '' event
do
    if [[ "$event" =~ /[^/]+\.xlsx$ && ! "$event" =~ /[^/]+\.download/ ]]; then

        if ! grep -q "^$event$" "$processed_file"; then
            /Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to csv "$event"
            echo "converted $event to csv" >> "$processed_file"
            mv $event ~/Documents/ms-office/xlsx/
            mv *.csv ~/Documents/
        fi
    fi
done

