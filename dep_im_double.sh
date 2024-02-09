#!/bin/bash

#create folder withing current directory to hold newly created jpegs
mkdir doubled_jpgs

#batch command to double pixel width and height of each file using ffmpeg and export all files to new folder created. all instances of jpeg extensions are listed
for file in *.jpg; do ffmpeg -i "$file" -vf scale="iw*2:ih*2" "./doubled_jpgs/${file%.jpg}_double.jpg"; done
for file in *.JPG; do ffmpeg -i "$file" -vf scale="iw*2:ih*2" "./doubled_jpgs/${file%.JPG}_double.jpg"; done
for file in *.jpeg; do ffmpeg -i "$file" -vf scale="iw*2:ih*2" "./doubled_jpgs/${file%.jpeg}_double.jpg"; done
for file in *.JPEG; do ffmpeg -i "$file" -vf scale="iw*2:ih*2" "./doubled_jpgs/${file%.JPEG}_double.jpg"; done
for file in *.jp2; do ffmpeg -i "$file" -vf scale="iw*2:ih*2" "./doubled_jpgs/${file%.jp2}_double.jp2"; done
for file in *.JP2; do ffmpeg -i "$file" -vf scale="iw*2:ih*2" "./doubled_jpgs/${file%.JP2}_double.jp2"; done