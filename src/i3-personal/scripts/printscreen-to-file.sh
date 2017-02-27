#!/bin/sh

date=$(date '+%d-%m-%Y')
imgDir="$date-screenshot"
imgDirPath="$HOME/Documents/$imgDir"
if [ ! -d $imgDirPath ]; then
   mkdir $imgDirPath
fi

imgName="$(date '+%H:%M:%S')-screenshot.png"
imgPath="$imgDirPath/$imgName"

scrot $imgPath
