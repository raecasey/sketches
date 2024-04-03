#!/bin/bash
#script written by Raelene Casey 2024
#looks for PDFs and Work Documents in current directory. if files are found they are sorted into an information packages with exiftool metadata extracted according to their format.

echo 'PLEASE READ THE OUTPUT CAREFULLY'


#DOCS SORT
#check if any Docs in different extensions exist in the current folder. If any exist make three folders
if ls *.docx 1> /dev/null 2>&1 || ls *.doc 1> /dev/null 2>&1 || ls *.DOC 1> /dev/null 2>&1 || ls *.DOCX 1> /dev/null 2>&1; then 
	echo 'Docs are present'
	mkdir doc_ip
	mkdir metadata_doc
	mkdir objects_doc  
else
	echo 'there are no Docs in this current directory'
fi

#check if .docx extension present. if so export .txt and .csv exiftool files to metadata_doc folder and move .docx files to objects_doc folder
if ls *.docx 1> /dev/null 2>&1; then
	echo 'docx extension found'
	for file in *.docx; do exiftool "$file" >"metadata_doc/${file%.docx}.docx.txt"; done
	for file in *.docx; do exiftool -csv "$file" >"metadata_doc/${file%.docx}.docx.csv"; done
	mv *.docx ./objects_doc  
else
	echo 'no files with docx extension found in current directory'
fi

#check if .doc extension present. if so export .txt and .csv exiftool files to metadata_doc folder and move .doc files to objects_doc folder
if ls *.doc 1> /dev/null 2>&1; then 
	echo 'doc extension found'
	for file in *.doc; do exiftool "$file" >"metadata_doc/${file%.doc}.doc.txt"; done
	for file in *.doc; do exiftool -csv "$file" >"metadata_doc/${file%.doc}.doc.csv"; done
	mv *.doc ./objects_doc  
else
	echo 'no files with doc extension found in current directory'
fi

#check if .DOCX extension present. if so export .txt and .csv exiftool files to metadata_doc folder and move .DOCX files to objects_doc folder
if ls *.DOCX 1> /dev/null 2>&1; then 
	echo 'DOCX extension found'
	for file in *.DOCX; do exiftool "$file" >"metadata_doc/${file%.DOCX}.DOCX.txt"; done
	for file in *.DOCX; do exiftool -csv "$file" >"metadata_doc/${file%.DOCX}.DOCX.csv"; done
	mv *.DOCX ./objects_doc  
else
	echo 'no file with DOCX extension found in current directory'
fi

#check if .DOC extension present. if so export .txt and .csv exiftool files to metadata_doc folder and move .DOC files to objects_doc folder
if ls *.DOC 1> /dev/null 2>&1; then 
	echo 'DOC extension found'
	for file in *.DOC; do exiftool "$file" >"metadata_doc/${file%.DOC}.DOC.txt"; done
	for file in *.DOC; do exiftool -csv "$file" >"metadata_doc/${file%.DOC}.DOC.csv"; done
	mv *.DOC ./objects_doc  
else
	echo 'no file with DOC extension found in current directory'
fi

#PDFS SORT
#check if any PDFs in different extensions exist in the current folder. If any exist make three folders
if ls *.pdf 1> /dev/null 2>&1 || ls *.PDF 1> /dev/null 2>&1; then 
	echo 'PDFs are present'
	mkdir pdf_ip
	mkdir metadata_pdf
	mkdir objects_pdf  
else
	echo 'there are no PDFs in this current directory'
fi

#check if .pdf extension present. if so export .txt and .csv exiftool files to metadata_pdf folder and move .pdf files to objects_pdf folder
if ls *.pdf 1> /dev/null 2>&1; then 
	echo 'pdf extension found'
	for file in *.pdf; do exiftool "$file" >"metadata_pdf/${file%.pdf}.pdf.txt"; done
	for file in *.pdf; do exiftool -csv "$file" >"metadata_pdf/${file%.pdf}.pdf.csv"; done
	mv *.pdf ./objects_pdf  
else
	echo 'no files with pdf extension found in current directory'
fi

#check if .PDF extension present. if so export .txt and .csv exiftool files to metadata_pdf folder and move .PDF files to objects_pdf folder
if ls *.PDF 1> /dev/null 2>&1; then 
	echo 'PDF extension found'
	for file in *.PDF; do exiftool "$file" >"metadata_pdf/${file%.PDF}.PDF.txt"; done
	for file in *.PDF; do exiftool -csv "$file" >"metadata_pdf/${file%.PDF}.PDF.csv"; done
	mv *.PDF ./objects_pdf  
else
	echo 'no file with PDF extension found in current directory'
fi



#move and rename files into information package

#DOC Information Package
if ls doc_ip; then
	mv metadata_doc doc_ip
	mv objects_doc doc_ip
	mv doc_ip/metadata_doc doc_ip/metadata
	mv doc_ip/objects_doc doc_ip/objects
 #script will break if ifiscripts not installed
 	manifest.py -s doc_ip/objects
	echo 'doc information package created'
else
	echo 'no doc information package created'
fi

#PDF Information Package
if ls pdf_ip; then
	mv metadata_pdf pdf_ip
	mv objects_pdf pdf_ip
	mv pdf_ip/metadata_pdf pdf_ip/metadata
	mv pdf_ip/objects_pdf pdf_ip/objects
 #script will break if ifiscripts not installed
 	manifest.py -s pdf_ip/objects
	echo 'pdf information package created'
else
	echo 'no pdf information package created'
fi


echo 'THIS SCRIPT IS NOT RECURSIVE'
