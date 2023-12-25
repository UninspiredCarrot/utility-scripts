#!/bin/bash

nohup ./image-to-picture-folder.sh > utility-script-log.txt 2>&1 &
nohup ./docx-to-pdf.sh > utility-script-log.txt 2>&1 &
nohup ./xlsx-to-csv.sh > utility-script-log.txt 2>&1 &
nohup ./docs-to-documents-folder.sh > utility-script-log.txt 2>&1 &