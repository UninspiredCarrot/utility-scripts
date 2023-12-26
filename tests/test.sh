#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)



echo "Testing docx to pdf"
cd ~/Downloads
wget https://file-examples.com/wp-content/storage/2017/02/file-sample_100kB.docx

sleep 5

if [ -e ~/Downloads/file-sample_100kB.docx ]; then
    echo "${RED} FAILED ${RESET}"
    rm ~/Downloads/file-sample_100kB.docx
else
    if [ -e ~/Documents/file-sample_100kB.pdf ]; then
        echo "${GREEN} PASSED ${RESET}"

    fi
fi


echo "Testing docs to documents"
cd ~/Downloads
wget https://file-examples.com/storage/feaef18a3c6587263a0ed0e/2017/10/file-sample_150kB.pdf

sleep 5

if [ -e ~/Downloads/file-sample_150kB.pdf ]; then
    echo "${RED} FAILED ${RESET}"
    rm ~/Downloads/file-sample_150kB.pdf
else
    if [ -e ~/Documents/file-sample_150kB.pdf ]; then
        echo "${GREEN} PASSED ${RESET}"
    fi
fi

echo "Testing images to pictures"
cd ~/Downloads
wget https://file-examples.com/wp-content/storage/2020/03/file_example_WEBP_50kB.webp

sleep 5

if [ -e ~/Downloads/file_example_WEBP_50kB.webp ]; then
    echo "${RED} FAILED ${RESET}"

    rm ~/Downloads/file_example_WEBP_50kB.webp
else
    if [ -e ~/Pictures/file_example_WEBP_50kB.webp ]; then
       echo "${GREEN} PASSED ${RESET}"
    fi
fi
