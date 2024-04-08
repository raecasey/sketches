#!/bin/bash
#script written by Raelene Casey 2024

for file in *.jpg; do ffmpeg -i "$file" -vf scale="iw/4:ih/4" "./halved_jpgs/${file%.jpg}_quart.png"; done
for file in *.JPG; do ffmpeg -i "$file" -vf scale="iw/4:ih/4" "./halved_jpgs/${file%.JPG}_quart.png"; done
for file in *.jpeg; do ffmpeg -i "$file" -vf scale="iw/4:ih/4" "./halved_jpgs/${file%.jpeg}_quart.png"; done
for file in *.JPEG; do ffmpeg -i "$file" -vf scale="iw/4:ih/4" "./halved_jpgs/${file%.JPEG}_quart.png"; done
for file in *.jp2; do ffmpeg -i "$file" -vf scale="iw/4:ih/4" "./halved_jpgs/${file%.jp2}_quart.png"; done
for file in *.JP2; do ffmpeg -i "$file" -vf scale="iw/4:ih/4" "./halved_jpgs/${file%.JP2}_quart.png"; done
