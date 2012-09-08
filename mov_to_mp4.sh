#!/bin/bash

DIR="new"

for FILE in *.mov;
do
    FILENAME=`ls |grep "$FILE" |awk -F "." '{print $1}'`
    echo "[INFO] Processing file $DIR/$FILENAME.mp4"
    ffmpeg -i "$FILE" -vcodec libx264 -strict experimental "$DIR/$FILENAME.mp4"
done;
