#!/bin/bash
#script written by Raelene Casey 2024
#checks if there are any instances of PNGs in current directory. if PNGs are found they are sorted into an information package with exiftool metadata extracted.

echo 'PLEASE READ THE OUTPUT CAREFULLY'

#check if any PNGs in different extensions exist in the current folder. If any exist make three folders
if ls *.png 1> /dev/null 2>&1 || ls *.PNG 1> /dev/null 2>&1; then 
	echo 'PNGs are present'
	mkdir png_ip
	mkdir metadata_png
	mkdir objects_png  
else
	echo 'there are no PNGs in this current directory'
fi

#check if .png extension present. if so export .txt and .csv exiftool files to metadata_png folder and move .png files to objects_png folder
if ls *.png 1> /dev/null 2>&1; then 
	echo 'png extension found'
	for file in *.png; do exiftool "$file" >"metadata_png/${file%.png}.png.txt"; done
	for file in *.png; do exiftool -csv "$file" >"metadata_png/${file%.png}.png.csv"; done
	mv *.png ./objects_png  
else
	echo 'no files with png extension found in current directory'
fi

#check if .PNG extension present. if so export .txt and .csv exiftool files to metadata_png folder and move .PNG files to objects_png folder
if ls *.PNG 1> /dev/null 2>&1; then 
	echo 'PNG extension found'
	for file in *.PNG; do exiftool "$file" >"metadata_png/${file%.PNG}.PNG.txt"; done
	for file in *.PNG; do exiftool -csv "$file" >"metadata_png/${file%.PNG}.PNG.csv"; done
	mv *.PNG ./objects_png  
else
	echo 'no file with PNG extension found in current directory'
fi

#move and rename files into information package
if ls png_ip; then
	mv metadata_png png_ip
	mv objects_png png_ip
	mv png_ip/metadata_png png_ip/metadata
	mv png_ip/objects_png png_ip/objects
	echo 'png information package created'
else
	echo 'no png information package created'
fi

echo 'THIS SCRIPT IS NOT RECURSIVE'
