#!/bin/bash
#script written by Raelene Casey 2024
#checks if there are any instances of IIQs in current directory. if IIQs are found they are sorted into an information package with exiftool metadata extracted.

echo 'PLEASE READ THE OUTPUT CAREFULLY'

#check if any IIQs in different extensions exist in the current folder. If any exist make three folders
if ls *.iiq 1> /dev/null 2>&1 || ls *.IIQ 1> /dev/null 2>&1; then 
	echo 'IIQs are present'
	mkdir iiq_ip
	mkdir metadata_iiq
	mkdir objects_iiq  
else
	echo 'there are no IIQs in this current directory'
fi

#check if .iiq extension present. if so export .txt and .csv exiftool files to metadata_iiq folder and move .iiq files to objects_iiq folder
if ls *.iiq 1> /dev/null 2>&1; then 
	echo 'iiq extension found'
	for file in *.iiq; do exiftool "$file" >"metadata_iiq/${file%.iiq}.iiq.txt"; done
	for file in *.iiq; do exiftool -csv "$file" >"metadata_iiq/${file%.iiq}.iiq.csv"; done
	mv *.iiq ./objects_iiq  
else
	echo 'no files with iiq extension found in current directory'
fi

#check if .IIQ extension present. if so export .txt and .csv exiftool files to metadata_iiq folder and move .IIQ files to objects_iiq folder
if ls *.IIQ 1> /dev/null 2>&1; then 
	echo 'IIQ extension found'
	for file in *.IIQ; do exiftool "$file" >"metadata_iiq/${file%.IIQ}.IIQ.txt"; done
	for file in *.IIQ; do exiftool -csv "$file" >"metadata_iiq/${file%.IIQ}.IIQ.csv"; done
	mv *.IIQ ./objects_iiq  
else
	echo 'no file with IIQ extension found in current directory'
fi

#move and rename files into information package
if ls iiq_ip; then
	mv metadata_iiq iiq_ip
	mv objects_iiq iiq_ip
	mv iiq_ip/metadata_iiq iiq_ip/metadata
	mv iiq_ip/objects_iiq iiq_ip/objects
	echo 'iiq information package created'
else
	echo 'no iiq information package created'
fi

echo 'THIS SCRIPT IS NOT RECURSIVE'
