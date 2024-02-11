#!/bin/bash
#script written by Raelene Casey 2024
#checks if there are any instances of DNGs in current directory. if DNGs are found they are sorted into an information package with exiftool metadata extracted.

echo 'PLEASE READ THE OUTPUT CAREFULLY'

#check if any DNGs in different extensions exist in the current folder. If any exist make three folders
if ls *.dng 1> /dev/null 2>&1 || ls *.DNG 1> /dev/null 2>&1; then 
	echo 'DNGs are present'
	mkdir dng_ip
	mkdir metadata_dng
	mkdir objects_dng  
else
	echo 'there are no DNGs in this current directory'
fi

#check if .dng extension present. if so export .txt and .csv exiftool files to metadata_dng folder and move .dng files to objects_dng folder
if ls *.dng 1> /dev/null 2>&1; then 
	echo 'dng extension found'
	for file in *.dng; do exiftool "$file" >"metadata_dng/${file%.dng}.dng.txt"; done
	for file in *.dng; do exiftool -csv "$file" >"metadata_dng/${file%.dng}.dng.csv"; done
	mv *.dng ./objects_dng  
else
	echo 'no files with dng extension found in current directory'
fi

#check if .DNG extension present. if so export .txt and .csv exiftool files to metadata_dng folder and move .DNG files to objects_dng folder
if ls *.DNG 1> /dev/null 2>&1; then 
	echo 'DNG extension found'
	for file in *.DNG; do exiftool "$file" >"metadata_dng/${file%.DNG}.DNG.txt"; done
	for file in *.DNG; do exiftool -csv "$file" >"metadata_dng/${file%.DNG}.DNG.csv"; done
	mv *.DNG ./objects_dng  
else
	echo 'no file with DNG extension found in current directory'
fi

#move and rename files into information package
if ls dng_ip; then
	mv metadata_dng dng_ip
	mv objects_dng dng_ip
	mv dng_ip/metadata_dng dng_ip/metadata
	mv dng_ip/objects_dng dng_ip/objects
	echo 'dng information package created'
else
	echo 'no dng information package created'
fi

echo 'THIS SCRIPT IS NOT RECURSIVE'