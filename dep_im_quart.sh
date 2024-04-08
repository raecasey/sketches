#!/bin/bash

#create folder withing current directory to hold newly created jpegs
mkdir quart_jpgs

#batch command to halve pixel width and height of each file using ffmpeg and export to new folder created. all instances of jpeg extensions are listed
for file in *.jpg; do ffmpeg -i "$file" -vf scale="iw/4:ih/4" "./quart_jpgs/${file%.jpg}_quart.jpg"; done
for file in *.JPG; do ffmpeg -i "$file" -vf scale="iw/4:ih/4" "./quart_jpgs/${file%.JPG}_quart.jpg"; done
for file in *.jpeg; do ffmpeg -i "$file" -vf scale="iw/4:ih/4" "./quart_jpgs/${file%.jpeg}_quart.jpg"; done
for file in *.JPEG; do ffmpeg -i "$file" -vf scale="iw/4:ih/4" "./quart_jpgs/${file%.JPEG}_quart.jpg"; done
for file in *.jp2; do ffmpeg -i "$file" -vf scale="iw/4:ih/4" "./quart_jpgs/${file%.jp2}_quart.jp2"; done
for file in *.JP2; do ffmpeg -i "$file" -vf scale="iw/4:ih/4" "./quart_jpgs/${file%.JP2}_quart.jp2"; done
