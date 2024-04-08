#!/bin/bash
#script written by Raelene Casey 2024

for file in *.jpg; do ffmpeg -i "$file" -vf scale="iw/2:ih/2" "./halved_jpgs/${file%.jpg}_half.png"; done
for file in *.JPG; do ffmpeg -i "$file" -vf scale="iw/2:ih/2" "./halved_jpgs/${file%.JPG}_half.png"; done
for file in *.jpeg; do ffmpeg -i "$file" -vf scale="iw/2:ih/2" "./halved_jpgs/${file%.jpeg}_half.png"; done
for file in *.JPEG; do ffmpeg -i "$file" -vf scale="iw/2:ih/2" "./halved_jpgs/${file%.JPEG}_half.png"; done
for file in *.jp2; do ffmpeg -i "$file" -vf scale="iw/2:ih/2" "./halved_jpgs/${file%.jp2}_half.png"; done
for file in *.JP2; do ffmpeg -i "$file" -vf scale="iw/2:ih/2" "./halved_jpgs/${file%.JP2}_half.png"; done
