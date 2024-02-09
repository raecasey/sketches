#!/bin/bash
#ffmpeg is a dependency

#create folder withing current directory to hold newly created jpegs
mkdir 309width_jpgs

#batch command to set pixel width to 309 and height to match aspect ratio of original. Using ffmpeg. Exporting to new folder created. all instances of jpeg extensions are listed
for file in *.jpg; do ffmpeg -i "$file" -vf scale="309:-1" "./309width_jpgs/${file%.jpg}_309w.jpg"; done
for file in *.JPG; do ffmpeg -i "$file" -vf scale="309:-1" "./309width_jpgs/${file%.JPG}_309w.jpg"; done
for file in *.jpeg; do ffmpeg -i "$file" -vf scale="309:-1" "./309width_jpgs/${file%.jpeg}_309w.jpg"; done
for file in *.JPEG; do ffmpeg -i "$file" -vf scale="309:-1" "./309width_jpgs/${file%.JPEG}_309w.jpg"; done
for file in *.jp2; do ffmpeg -i "$file" -vf scale="309:-1" "./309width_jpgs/${file%.jp2}_309w.jp2"; done
for file in *.JP2; do ffmpeg -i "$file" -vf scale="309:-1" "./309width_jpgs/${file%.JP2}_309w.jp2"; done
