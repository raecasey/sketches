#!/bin/bash
#script written by Raelene Casey 2024
#looks for Jpegs, Tiffs, DNGs, IIQs, PNGs, NEFs and PSDs in current directory. if images are found they are sorted into an information packages with exiftool metadata extracted according to their format.

echo 'PLEASE READ THE OUTPUT CAREFULLY'
#JPEGS SORT
#check if any Jpegs in different extensions exist in the current folder. If any exist make three folders
if ls *.jpg 1> /dev/null 2>&1 || ls *.jpeg 1> /dev/null 2>&1 || ls *.JPEG 1> /dev/null 2>&1 || ls *.JPG 1> /dev/null 2>&1; then 
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

#TIFFS SORT
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

#DNGS SORT
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

#IIQS SORT
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

#NEFS SORT
#check if any NEFs in different extensions exist in the current folder. If any exist make three folders
if ls *.nef 1> /dev/null 2>&1 || ls *.NEF 1> /dev/null 2>&1; then 
	echo 'NEFs are present'
	mkdir nef_ip
	mkdir metadata_nef
	mkdir objects_nef  
else
	echo 'there are no NEFs in this current directory'
fi

#check if .nef extension present. if so export .txt and .csv exiftool files to metadata_nef folder and move .nef files to objects_nef folder
if ls *.nef 1> /dev/null 2>&1; then 
	echo 'nef extension found'
	for file in *.nef; do exiftool "$file" >"metadata_nef/${file%.nef}.nef.txt"; done
	for file in *.nef; do exiftool -csv "$file" >"metadata_nef/${file%.nef}.nef.csv"; done
	mv *.nef ./objects_nef  
else
	echo 'no files with nef extension found in current directory'
fi

#check if .NEF extension present. if so export .txt and .csv exiftool files to metadata_nef folder and move .NEF files to objects_nef folder
if ls *.NEF 1> /dev/null 2>&1; then 
	echo 'NEF extension found'
	for file in *.NEF; do exiftool "$file" >"metadata_nef/${file%.NEF}.NEF.txt"; done
	for file in *.NEF; do exiftool -csv "$file" >"metadata_nef/${file%.NEF}.NEF.csv"; done
	mv *.NEF ./objects_nef  
else
	echo 'no file with NEF extension found in current directory'
fi

#PNGS SORT
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

#PSDS SORT
#check if any PSDs in different extensions exist in the current folder. If any exist make three folders
if ls *.psd 1> /dev/null 2>&1 || ls *.PSD 1> /dev/null 2>&1; then 
	echo 'PSDs are present'
	mkdir psd_ip
	mkdir metadata_psd
	mkdir objects_psd  
else
	echo 'there are no PSDs in this current directory'
fi

#check if .psd extension present. if so export .txt and .csv exiftool files to metadata_psd folder and move .psd files to objects_psd folder
if ls *.psd 1> /dev/null 2>&1; then 
	echo 'psd extension found'
	for file in *.psd; do exiftool "$file" >"metadata_psd/${file%.psd}.psd.txt"; done
	for file in *.psd; do exiftool -csv "$file" >"metadata_psd/${file%.psd}.psd.csv"; done
	mv *.psd ./objects_psd  
else
	echo 'no files with psd extension found in current directory'
fi

#check if .PSD extension present. if so export .txt and .csv exiftool files to metadata_psd folder and move .PSD files to objects_psd folder
if ls *.PSD 1> /dev/null 2>&1; then 
	echo 'PSD extension found'
	for file in *.PSD; do exiftool "$file" >"metadata_psd/${file%.PSD}.PSD.txt"; done
	for file in *.PSD; do exiftool -csv "$file" >"metadata_psd/${file%.PSD}.PSD.csv"; done
	mv *.PSD ./objects_psd  
else
	echo 'no file with PSD extension found in current directory'
fi



#move and rename files into information package
#Jpeg Information Package
if ls jpeg_ip; then
	mv metadata_jpeg jpeg_ip
	mv objects_jpeg jpeg_ip
	mv jpeg_ip/metadata_jpeg jpeg_ip/metadata
	mv jpeg_ip/objects_jpeg jpeg_ip/objects
 #script will break if ifiscripts not installed
 	manifest.py -s jpeg_ip/objects
	echo 'jpeg information package created'
else
	echo 'no jpeg information package created'
fi

#TIFF Information Package
if ls tiff_ip; then
	mv metadata_tiff tiff_ip
	mv objects_tiff tiff_ip
	mv tiff_ip/metadata_tiff tiff_ip/metadata
	mv tiff_ip/objects_tiff tiff_ip/objects
 #script will break if ifiscripts not installed
 	manifest.py -s tiff_ip/objects
	echo 'tiff information package created'
else
	echo 'no tiff information package created'
fi

#DNG Information Package
if ls dng_ip; then
	mv metadata_dng dng_ip
	mv objects_dng dng_ip
	mv dng_ip/metadata_dng dng_ip/metadata
	mv dng_ip/objects_dng dng_ip/objects
 #script will break if ifiscripts not installed
 	manifest.py -s dng_ip/objects
	echo 'dng information package created'
else
	echo 'no dng information package created'
fi

#IIQ Information Package
if ls iiq_ip; then
	mv metadata_iiq iiq_ip
	mv objects_iiq iiq_ip
	mv iiq_ip/metadata_iiq iiq_ip/metadata
	mv iiq_ip/objects_iiq iiq_ip/objects
 #script will break if ifiscripts not installed
 	manifest.py -s iiq_ip/objects
	echo 'iiq information package created'
else
	echo 'no iiq information package created'
fi

#PNG Information Package
if ls png_ip; then
	mv metadata_png png_ip
	mv objects_png png_ip
	mv png_ip/metadata_png png_ip/metadata
	mv png_ip/objects_png png_ip/objects
 #script will break if ifiscripts not installed
 	manifest.py -s png_ip/objects
	echo 'png information package created'
else
	echo 'no png information package created'
fi

#PSD Information Package
if ls psd_ip; then
	mv metadata_psd psd_ip
	mv objects_psd psd_ip
	mv psd_ip/metadata_psd psd_ip/metadata
	mv psd_ip/objects_psd psd_ip/objects
 #script will break if ifiscripts not installed
 	manifest.py -s psd_ip/objects
	echo 'psd information package created'
else
	echo 'no psd information package created'
fi

#NEF Information Package
if ls nef_ip; then
	mv metadata_nef nef_ip
	mv objects_nef nef_ip
	mv nef_ip/metadata_nef nef_ip/metadata
	mv nef_ip/objects_nef nef_ip/objects
 #script will break if ifiscripts not installed
 	manifest.py -s nef_ip/objects
	echo 'nef information package created'
else
	echo 'no nef information package created'
fi
echo 'THIS SCRIPT IS NOT RECURSIVE'
