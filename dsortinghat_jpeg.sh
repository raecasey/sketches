#!/bin/bash
#script written by Raelene Casey 2024
#checks if there are any instances of jpegs in current directory. if jpegs are found they are sorted into an information package with exiftool metadata extracted.
echo 'PLEASE READ THE OUTPUT CAREFULLY'

#check if any Jpegs in different extensions exist in the current folder. If any exist make two folders
if ls *.jpg 1> /dev/null || ls *.jpeg 1> /dev/null || ls *.JPG 1> /dev/null 2>&1; then 
	echo 'Jpegs are present'
 	mkdir jpeg_ip
	mkdir metadata_jpeg
	mkdir objects_jpeg  
else
	echo 'there are no Jpegs in this current directory'
fi

#check if .jpg extension present. if so export .txt and .csv exiftool files to metadata_jpeg folder and move .jpg files to objects_jpeg folder
if ls *.jpg 1> /dev/null 2>&1; then
	echo 'jpg extension found'
	for file in *.jpg; do exiftool "$file" >"metadata_jpeg/${file%.jpg}.jpg.txt"; done
	for file in *.jpg; do exiftool -csv "$file" >"metadata_jpeg/${file%.jpg}.jpg.csv"; done
	mv *.jpg ./objects_jpeg  
else
	echo 'no files with jpg extension found in current directory'
fi

#check if .jpeg extension present. if so export .txt and .csv exiftool files to metadata_jpeg folder and move .jpeg files to objects_jpeg folder
if ls *.jpeg 1> /dev/null 2>&1; then 
	echo 'jpeg extension found'
	for file in *.jpeg; do exiftool "$file" >"metadata_jpeg/${file%.jpeg}.jpeg.txt"; done
	for file in *.jpeg; do exiftool -csv "$file" >"metadata_jpeg/${file%.jpeg}.jpeg.csv"; done
	mv *.jpeg ./objects_jpeg  
else
	echo 'no files with jpeg extension found in current directory'
fi

#check if .JPG extension present. if so export .txt and .csv exiftool files to metadata_jpeg folder and move .JPG files to objects_jpeg folder
if ls *.JPG 1> /dev/null 2>&1; then 
	echo 'JPG extension found'
	for file in *.JPG; do exiftool "$file" >"metadata_jpeg/${file%.JPG}.JPG.txt"; done
	for file in *.JPG; do exiftool -csv "$file" >"metadata_jpeg/${file%.JPG}.JPG.csv"; done
	mv *.JPG ./objects_jpeg  
else
	echo 'no file with JPG extension found in current directory'
fi

#check if .JPEG extension present. if so export .txt and .csv exiftool files to metadata_jpeg folder and move .JPEG files to objects_jpeg folder
if ls *.JPEG 1> /dev/null 2>&1; then 
	echo 'JPEG extension found'
	for file in *.JPEG; do exiftool "$file" >"metadata_jpeg/${file%.JPEG}.JPEG.txt"; done
	for file in *.JPEG; do exiftool -csv "$file" >"metadata_jpeg/${file%.JPEG}.JPEG.csv"; done
	mv *.JPEG ./objects_jpeg  
else
	echo 'no file with JPEG extension found in current directory'
fi

#move and rename files into information package
if ls jpeg_ip; then
	mv metadata_jpeg jpeg_ip
	mv objects_jpeg jpeg_ip
	mv jpeg_ip/metadata_jpeg jpeg_ip/metadata
	mv jpeg_ip/objects_jpeg jpeg_ip/objects
 #requires ifiscripts as a dependency or script will break
 	manifest.py -s jpeg_ip/objects
	echo 'jpeg information package created'
else
	echo 'no jpeg information package created'
fi

echo 'THIS SCRIPT IS NOT RECURSIVE'
