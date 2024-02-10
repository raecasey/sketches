#!/bin/bash
#script written by Raelene Casey 2024

echo 'PLEASE READ TERMINAL OUTPUT CAREFULLY'

#check if the current folder contains any files with jpg extension. 
#If it does then create two folders and move the jpg files to one of them
if ls *.jpg 1> /dev/null 2>&1; then 
	mkdir metadata_jpeg
	mkdir objects_jpeg
	mv *.jpg ./objects_jpeg  
else
	echo 'no file with jpg extension is present in current directory'
fi

#check if the current folder contains any files with jpeg extension. 
#If it does then create two folders and move the jpeg files to one of them. 
if ls *.jpeg 1> /dev/null 2>&1; then 
	mkdir metadata_jpeg 
	mkdir objects_jpeg 
	mv *.jpeg ./objects_jpeg  
else
	echo 'no file with jpeg extension is present in current directory'
fi

#check if the current folder contains any files with JPG extension. 
#If it does then create two folders and move the JPG files to one of them. 
if ls *.JPG 1> /dev/null 2>&1; then 
	mkdir metadata_jpeg 
	mkdir objects_jpeg 
	mv *.JPG ./objects_jpeg  
else
	echo 'no file with JPG extension is present in current directory'
fi

#check if the current folder contains any files with JPEG extension. 
#If it does then create two folders and move the JPEG files to one of them. 
if ls *.JPEG 1> /dev/null 2>&1; then 
	mkdir metadata_jpeg 
	mkdir objects_jpeg 
	mv *.JPEG ./objects_jpeg  
else
	echo 'no file with JPEG extension is present in current directory'
fi
echo 'THIS SCRIPT IS NOT RECURSIVE'
