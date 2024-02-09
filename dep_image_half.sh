#!/bin/bash

#create folder withing current directory to hold newly created jpegs
mkdir halved_jpgs

#batch command to halve pixel width and height of each file using ffmpeg and export to new folder created. all instances of jpeg extensions are listed
for file in *.jpg; do ffmpeg -i "$file" -vf scale="iw/2:ih/2" "./halved_jpgs/${file%.jpg}_half.jpg"; done
for file in *.JPG; do ffmpeg -i "$file" -vf scale="iw/2:ih/2" "./halved_jpgs/${file%.JPG}_half.jpg"; done
for file in *.jpeg; do ffmpeg -i "$file" -vf scale="iw/2:ih/2" "./halved_jpgs/${file%.jpeg}_half.jpg"; done
for file in *.JPEG; do ffmpeg -i "$file" -vf scale="iw/2:ih/2" "./halved_jpgs/${file%.JPEG}_half.jpg"; done
for file in *.jp2; do ffmpeg -i "$file" -vf scale="iw/2:ih/2" "./halved_jpgs/${file%.jp2}_half.jp2"; done
for file in *.JP2; do ffmpeg -i "$file" -vf scale="iw/2:ih/2" "./halved_jpgs/${file%.JP2}_half.jp2"; done
