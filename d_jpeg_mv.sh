#!/bin/bash

#JPEGS
	#jpg
if ls *.jpg 1> /dev/null 2>&1; then 
	mkdir metadata_jpeg
	mkdir objects_jpeg
	mv *.jpg ./objects_jpeg  
else
	echo 'no file with jpg extension is present in current directory'
fi
	#jpeg
if ls *.jpeg 1> /dev/null 2>&1; then 
	mkdir metadata_jpeg 
	mkdir objects_jpeg 
	mv *.jpeg ./objects_jpeg  
else
	echo 'no file with jpeg extension is present in current directory'
fi

	#JPG
if ls *.JPG 1> /dev/null 2>&1; then 
	mkdir metadata_jpeg 
	mkdir objects_jpeg 
	mv *.JPG ./objects_jpeg  
else
	echo 'no file with JPG extension is present in current directory'
fi

	#JPEG
if ls *.JPEG 1> /dev/null 2>&1; then 
	mkdir metadata_jpeg 
	mkdir objects_jpeg 
	mv *.JPEG ./objects_jpeg  
else
	echo 'no file with JPEG extension is present in current directory'
fi
