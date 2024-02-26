#!/bin/bash
#script written by Raelene Casey 2024
#checks if there are any instances of tiffs in current directory. if tiffs are found they are sorted into an information package with exiftool metadata extracted.

echo 'PLEASE READ THE OUTPUT CAREFULLY'

#check if any Tiffs in different extensions exist in the current folder. If any exist make three folders
if ls *.tif 1> /dev/null 2>&1 || ls *.tiff 1> /dev/null 2>&1 || ls *.TIFF 1> /dev/null 2>&1 || ls *.TIF 1> /dev/null 2>&1; then 
	echo 'Tiffs are present'
	mkdir tiff_ip
	mkdir metadata_tiff
	mkdir objects_tiff  
else
	echo 'there are no Tiffs in this current directory'
fi

#check if .tif extension present. if so export .txt and .csv exiftool files to metadata_tiff folder and move .tif files to objects_tiff folder
if ls *.tif 1> /dev/null 2>&1; then
	echo 'tif extension found'
	for file in *.tif; do exiftool "$file" >"metadata_tiff/${file%.tif}.tif.txt"; done
	for file in *.tif; do exiftool -csv "$file" >"metadata_tiff/${file%.tif}.tif.csv"; done
	mv *.tif ./objects_tiff  
else
	echo 'no files with tif extension found in current directory'
fi

#check if .tiff extension present. if so export .txt and .csv exiftool files to metadata_tiff folder and move .tiff files to objects_tiff folder
if ls *.tiff 1> /dev/null 2>&1; then 
	echo 'tiff extension found'
	for file in *.tiff; do exiftool "$file" >"metadata_tiff/${file%.tiff}.tiff.txt"; done
	for file in *.tiff; do exiftool -csv "$file" >"metadata_tiff/${file%.tiff}.tiff.csv"; done
	mv *.tiff ./objects_tiff  
else
	echo 'no files with tiff extension found in current directory'
fi

#check if .TIF extension present. if so export .txt and .csv exiftool files to metadata_tiff folder and move .TIF files to objects_tiff folder
if ls *.TIF 1> /dev/null 2>&1; then 
	echo 'TIF extension found'
	for file in *.TIF; do exiftool "$file" >"metadata_tiff/${file%.TIF}.TIF.txt"; done
	for file in *.TIF; do exiftool -csv "$file" >"metadata_tiff/${file%.TIF}.TIF.csv"; done
	mv *.TIF ./objects_tiff  
else
	echo 'no file with TIF extension found in current directory'
fi

#check if .TIFF extension present. if so export .txt and .csv exiftool files to metadata_tiff folder and move .TIFF files to objects_tiff folder
if ls *.TIFF 1> /dev/null 2>&1; then 
	echo 'TIFF extension found'
	for file in *.TIFF; do exiftool "$file" >"metadata_tiff/${file%.TIFF}.TIFF.txt"; done
	for file in *.TIFF; do exiftool -csv "$file" >"metadata_tiff/${file%.TIFF}.TIFF.csv"; done
	mv *.TIFF ./objects_tiff  
else
	echo 'no file with TIFF extension found in current directory'
fi

#move and rename files into information package
if ls tiff_ip; then
	
	mv metadata_tiff tiff_ip
	mv objects_tiff tiff_ip
	mv tiff_ip/metadata_tiff tiff_ip/metadata
	mv tiff_ip/objects_tiff tiff_ip/objects
 #ifiscripts is a dependency or script will break
 	manifest.py -s tiff_ip/objects
	echo 'tiff information package created'

else
	echo 'no tiff information package created'
	
fi


echo 'THIS SCRIPT IS NOT RECURSIVE'
