#!/bin/bash
#script written by Raelene Casey 2024
#extracting mediainfo metadata for DVD digital objects

echo 'PLEASE READ THE OUTPUT CAREFULLY'
#BUP SORT


#check if .BUP extension present. if so export .txt and .csv exiftool files to metadata folder
if ls *.BUP 1> /dev/null 2>&1 || ls *.bup 1> /dev/null 2>&1; then 
	echo 'BUP are present'
	mkdir metadata 
#extract metadata using mediainfo and export to txt and xml files
	for file in *.BUP; do mediainfo -f "$file" >"metadata/${file%.BUP}.bup.txt"; done
	for file in *.BUP; do mediainfo -f --Output=XML "$file" >"metadata/${file%.BUP}.bup.xml"; done
else
	echo 'there is no BUP in this current directory'
fi

#check if .IFO extension present. if so export .txt and .csv exiftool files to metadata folder
if ls *.IFO 1> /dev/null 2>&1 || ls *.ifo 1> /dev/null 2>&1; then 
	echo 'IFO are present'
	mkdir metadata 
#extract metadata using mediainfo and export to txt and xml files
	for file in *.IFO; do mediainfo -f "$file" >"metadata/${file%.IFO}.ifo.txt"; done
	for file in *.IFO; do mediainfo -f --Output=XML "$file" >"metadata/${file%.IFO}.ifo.xml"; done
else
	echo 'there is no IFO in this current directory'
fi

#check if .VOB extension present. if so export .txt and .csv exiftool files to metadata folder
if ls *.VOB 1> /dev/null 2>&1 || ls *.vob 1> /dev/null 2>&1; then 
	echo 'VOB are present'
	mkdir metadata 
#extract metadata using mediainfo and export to txt and xml files
	for file in *.VOB; do mediainfo -f "$file" >"metadata/${file%.VOB}.vob.txt"; done
	for file in *.VOB; do mediainfo -f --Output=XML "$file" >"metadata/${file%.VOB}.vob.xml"; done
else
	echo 'there is no VOB in this current directory'
fi