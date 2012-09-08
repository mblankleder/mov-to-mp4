#!/bin/bash

DIR="new"
MOV_FILES=`ls -al |grep "\.mov"|wc -l`

if [ $MOV_FILES -eq 0 ]
then
    echo "[ERROR] No mov files found"
    exit 0
else
    if [ ! -d "$DIR" ]
    then
        mkdir $DIR
    fi    
    for FILE in *.mov;
    do
        FILENAME=`ls |grep "$FILE" |awk -F "." '{print $1}'`
        echo "[INFO] Processing file $DIR/$FILENAME.mp4"
        ffmpeg -i "$FILE" -vcodec libx264 -strict experimental "$DIR/$FILENAME.mp4"
    done;
fi
