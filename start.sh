#!/bin/bash
# chmod +x tests/test.sh
# ./tests/test.sh
chmod +x image-to-picture-folder.sh
nohup ./image-to-picture-folder.sh > utility-script-log.txt 2>&1 &
chmod +x docx-to-pdf.sh
nohup ./docx-to-pdf.sh > utility-script-log.txt 2>&1 &
chmod +x docs-to-documents-folder.sh
nohup ./docs-to-documents-folder.sh > utility-script-log.txt 2>&1 &
chmod +x tests/test.sh
./tests/test.sh

