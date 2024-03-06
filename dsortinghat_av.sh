#!/bin/bash
#script written by Raelene Casey 2024
#checks if there are any instances of audio video files in current directory. if audio video files are found they are sorted into an information packages with mediainfo metadata extracted.

echo 'PLEASE READ THE OUTPUT CAREFULLY'

#check if any AV files of various containers exist in the current folder.
if ls *.mov 1> /dev/null 2>&1 || ls *.MOV 1> /dev/null 2>&1 || ls *.mp4 1> /dev/null 2>&1 || ls *.MP4 1> /dev/null 2>&1 || ls *.mpg 1> /dev/null 2>&1 || ls *.MPG 1> /dev/null 2>&1 || ls *.mp3 1> /dev/null 2>&1 || ls *.MP3 1> /dev/null 2>&1 || ls *.wav 1> /dev/null 2>&1 || ls *.WAV 1> /dev/null 2>&1 || ls *.avi 1> /dev/null 2>&1 || ls *.AVI 1> /dev/null 2>&1 || ls *.dv 1> /dev/null 2>&1 || ls *.DV 1> /dev/null 2>&1 || ls *.mkv 1> /dev/null 2>&1 || ls *.MKV 1> /dev/null 2>&1 || ls *.mxf 1> /dev/null 2>&1 ls *.MXF 1> /dev/null 2>&1 || ls *.wave 1> /dev/null 2>&1 || ls *.WAVE 1> /dev/null 2>&1 || ls *.m4a 1> /dev/null 2>&1 || ls *.M4A 1> /dev/null 2>&1; then 
	echo 'AV files are present' | tee av_sort.log
else
	echo 'there are no AV files in this current directory' 
fi

#movs
#check if QuickTime files present. if so create information package that includes extracted .txt and .xml mediainfo files. 
if ls *.mov 1> /dev/null 2>&1 || ls *.MOV 1> /dev/null 2>&1; then
	echo 'QuickTime files present' 
	#create folders for the information package
	mkdir mov_ip
	mkdir metadata_mov
	mkdir objects_mov 
	#extract metadata using mediainfo and export to txt and xml files
	for file in *.mov; do mediainfo -f "$file" >"metadata_mov/${file%.mov}.mov.txt"; done
	for file in *.MOV; do mediainfo -f "$file" >"metadata_mov/${file%.MOV}.mov.txt"; done
	for file in *.mov; do mediainfo -f --Output=XML "$file" >"metadata_mov/${file%.mov}.mov.xml"; done
	for file in *.MOV; do mediainfo -f --Output=XML "$file" >"metadata_mov/${file%.MOV}.mov.xml"; done
	#move QuickTime files to the objects_mov folder
	mv *.mov ./objects_mov
	mv *.MOV ./objects_mov
	#move and rename folders to create the information package
	mv metadata_mov mov_ip
	mv objects_mov mov_ip
	mv mov_ip/metadata_mov mov_ip/metadata
	mv mov_ip/objects_mov mov_ip/objects
      #ifiscripts is a dependency
 	manifest.py -s mov_ip/objects
else
	echo 'no QuickTime files found in current directory' 
fi

#mp4s
#check if mpg and MPG extensions present. if so create information package that includes extracted .txt and .xml mediainfo files.
if ls *.mp4 1> /dev/null 2>&1 || ls *.MP4 1> /dev/null 2>&1; then 
	echo 'mp4/MP4 extension found' | tee av_sort.log
	#create folders for the information package
	mkdir mp4_ip
	mkdir metadata_mp4
	mkdir objects_mp4 
	#extract metadata using mediainfo and export to txt and xml files
	for file in *.mp4; do mediainfo -f "$file" >"metadata_mp4/${file%.mp4}.mp4.txt"; done
	for file in *.MP4; do mediainfo -f "$file" >"metadata_mp4/${file%.MP4}.mp4.txt"; done
 	for file in *.mpg; do mediainfo -f "$file" >"metadata_mp4/${file%.mpg}.mp4.txt"; done
  	for file in *.MPG; do mediainfo -f "$file" >"metadata_mp4/${file%.MPG}.mp4.txt"; done
	for file in *.mp4; do mediainfo -f --Output=XML "$file" >"metadata_mp4/${file%.mp4}.mp4.xml"; done
	for file in *.MP4; do mediainfo -f --Output=XML "$file" >"metadata_mp4/${file%.MP4}.mp4.xml"; done
	for file in *.mpg; do mediainfo -f --Output=XML "$file" >"metadata_mp4/${file%.mpg}.mp4.xml"; done
 	for file in *.MPG; do mediainfo -f --Output=XML "$file" >"metadata_mp4/${file%.MPG}.mp4.xml"; done
	#move mp4 files to the objects_mp4 folder
	mv *.mp4 ./objects_mp4
	mv *.MP4 ./objects_mp4
 	mv *.mpg ./objects_mp4
  	mv *.MPG ./objects_mp4
	#move and rename folders to create the information package
	mv metadata_mp4 mp4_ip
	mv objects_mp4 mp4_ip
	mv mp4_ip/metadata_mp4 mp4_ip/metadata
	mv mp4_ip/objects_mp4 mp4_ip/objects
     #ifiscripts is a dependency
 	manifest.py -s mp4_ip/objects
else
	echo 'no files with mp4/MP4 extension found in current directory' 
fi

#mpegs other
#check if mp4 extensions present. if so create information package that includes extracted .txt and .xml mediainfo files.
if ls *.mpg 1> /dev/null 2>&1 || ls *.MPG 1> /dev/null 2>&1; then 
	echo 'mpg/MPG extension found' | tee av_sort.log
	#create folders for the information package
	mkdir mpeg_other_ip
	mkdir metadata_mpeg_other
	mkdir objects_mpeg_other 
	#extract metadata using mediainfo and export to txt and xml files
 	for file in *.mpg; do mediainfo -f "$file" >"metadata_mpeg_other/${file%.mpg}.mpg.txt"; done
  	for file in *.MPG; do mediainfo -f "$file" >"metadata_mpeg_other/${file%.MPG}.mpg.txt"; done
	for file in *.mpg; do mediainfo -f --Output=XML "$file" >"metadata_mpeg_other/${file%.mpg}.mpg.xml"; done
 	for file in *.MPG; do mediainfo -f --Output=XML "$file" >"metadata_mpeg_other/${file%.MPG}.mpg.xml"; done
	#move mppeg_other files to the objects_mpeg_other folder
 	mv *.mpg ./objects_mpeg_other
  	mv *.MPG ./objects_mpeg_other
	#move and rename folders to create the information package
	mv metadata_mpeg_other mpeg_other_ip
	mv objects_mpeg_other mpeg_other_ip
	mv mpeg_other_ip/metadata_mpeg_other mpeg_other_ip/metadata
	mv mpeg_other_ip/objects_mpeg_other mpeg_other_ip/objects
     #ifiscripts is a dependency 
 	manifest.py -s objects
else
	echo 'no files with mp4/MP4 extension found in current directory' 
fi

#wavs
#check if wav extensions present. if so create information package that includes extracted .txt and .xml mediainfo files.
if ls *.wav 1> /dev/null 2>&1 || ls *.WAV 1> /dev/null 2>&1 || ls *.wave 1> /dev/null 2>&1 || ls *.WAVE 1> /dev/null 2>&1; then 
	echo 'wav/wave files found'
	#create folders for the information package
	mkdir wav_ip
	mkdir metadata_wav
	mkdir objects_wav 
	#extract metadata using mediainfo and export to txt and xml files
	for file in *.wav; do mediainfo -f "$file" >"metadata_wav/${file%.wav}.wav.txt"; done
	for file in *.WAV; do mediainfo -f "$file" >"metadata_wav/${file%.WAV}.wav.txt"; done
	for file in *.wave; do mediainfo -f "$file" >"metadata_wav/${file%.wave}.wav.txt"; done
	for file in *.WAVE; do mediainfo -f "$file" >"metadata_wav/${file%.WAVE}.wav.txt"; done
	for file in *.wav; do mediainfo -f --Output=XML "$file" >"metadata_wav/${file%.wav}.wav.xml"; done
	for file in *.WAV; do mediainfo -f --Output=XML "$file" >"metadata_wav/${file%.WAV}.wav.xml"; done
	for file in *.wave; do mediainfo -f --Output=XML "$file" >"metadata_wav/${file%.wave}.wav.xml"; done
	for file in *.WAVE; do mediainfo -f --Output=XML "$file" >"metadata_wav/${file%.WAVE}.wav.xml"; done
	#move wav files to the objects_wav folder
	mv *.wav ./objects_wav
	mv *.WAV ./objects_wav
	mv *.wave ./objects_wav
	mv *.WAVE ./objects_wav
	#move and rename folders to create the information package
	mv metadata_wav wav_ip
	mv objects_wav wav_ip
	mv wav_ip/metadata_wav wav_ip/metadata
	mv wav_ip/objects_wav wav_ip/objects
       #ifiscripts is a dependency
 	manifest.py -s wav_ip/objects
else
	echo 'no wav/wave files found in current directory'
fi

#mp3s
#check if mp3 extensions present. if so create information package that includes extracted .txt and .xml mediainfo files.
if ls *.mp3 1> /dev/null 2>&1 || ls *.MP3 1> /dev/null 2>&1; then 
	echo 'mp3/MP3 extension found'
	#create folders for the information package
	mkdir mp3_ip
	mkdir metadata_mp3
	mkdir objects_mp3 
	#extract metadata using mediainfo and export to txt and xml files
	for file in *.mp3; do mediainfo -f "$file" >"metadata_mp3/${file%.mp3}.mp3.txt"; done
	for file in *.MP3; do mediainfo -f "$file" >"metadata_mp3/${file%.MP3}.mp3.txt"; done
	for file in *.mp3; do mediainfo -f --Output=XML "$file" >"metadata_mp3/${file%.mp3}.mp3.xml"; done
	for file in *.MP3; do mediainfo -f --Output=XML "$file" >"metadata_mp3/${file%.MP3}.mp3.xml"; done
	#move mp3 files to the objects_mp3 folder
	mv *.mp3 ./objects_mp3
	mv *.MP3 ./objects_mp3
	#move and rename folders to create the information package
	mv metadata_mp3 mp3_ip
	mv objects_mp3 mp3_ip
	mv mp3_ip/metadata_mp3 mp3_ip/metadata
	mv mp3_ip/objects_mp3 mp3_ip/objects
      #ifiscripts is a dependency
 	manifest.py -s mp3_ip/objects
else
	echo 'no files with mp3/MP3 extension found in current directory'
fi

#AVIs
#check if avi extensions present. if so create information package that includes extracted .txt and .xml mediainfo files.
if ls *.avi 1> /dev/null 2>&1 || ls *.AVI 1> /dev/null 2>&1; then 
	echo 'avi/AVI extension found'
	#create folders for the information package
	mkdir avi_ip
	mkdir metadata_avi
	mkdir objects_avi 
	#extract metadata using mediainfo and export to txt and xml files
	for file in *.avi; do mediainfo -f "$file" >"metadata_avi/${file%.avi}.avi.txt"; done
	for file in *.AVI; do mediainfo -f "$file" >"metadata_avi/${file%.AVI}.avi.txt"; done
	for file in *.avi; do mediainfo -f --Output=XML "$file" >"metadata_avi/${file%.avi}.avi.xml"; done
	for file in *.AVI; do mediainfo -f --Output=XML "$file" >"metadata_avi/${file%.AVI}.avi.xml"; done
	#move avi files to the objects_avi folder
	mv *.avi ./objects_avi
	mv *.AVI ./objects_avi
	#move and rename folders to create the information package
	mv metadata_avi avi_ip
	mv objects_avi avi_ip
	mv avi_ip/metadata_avi avi_ip/metadata
	mv avi_ip/objects_avi avi_ip/objects
     #ifiscripts is a dependency
 	manifest.py -s avi_ip/objects
else
	echo 'no files with avi/AVI extension found in current directory'
fi

#dvs
#check if dv extensions present. if so create information package that includes extracted .txt and .xml mediainfo files.
if ls *.dv 1> /dev/null 2>&1 || ls *.DV 1> /dev/null 2>&1; then 
	echo 'dv/DV extension found'
	#create folders for the information package
	mkdir dv_ip
	mkdir metadata_dv
	mkdir objects_dv 
	#extract metadata using mediainfo and export to txt and xml files
	for file in *.dv; do mediainfo -f "$file" >"metadata_dv/${file%.dv}.dv.txt"; done
	for file in *.DV; do mediainfo -f "$file" >"metadata_dv/${file%.DV}.dv.txt"; done
	for file in *.dv; do mediainfo -f --Output=XML "$file" >"metadata_dv/${file%.dv}.dv.xml"; done
	for file in *.DV; do mediainfo -f --Output=XML "$file" >"metadata_dv/${file%.DV}.dv.xml"; done
	#move dv files to the objects_dv folder
	mv *.dv ./objects_dv
	mv *.DV ./objects_dv
	#move and rename folders to create the information package
	mv metadata_dv dv_ip
	mv objects_dv dv_ip
	mv dv_ip/metadata_dv dv_ip/metadata
	mv dv_ip/objects_dv dv_ip/objects
    #ifiscripts is a dependency
 	manifest.py -s dv_ip/objects
else
	echo 'no files with dv/DV extension found in current directory'
fi

#mkvs
#check if mkv extensions present. if so create information package that includes extracted .txt and .xml mediainfo files.
if ls *.mkv 1> /dev/null 2>&1 || ls *.MKV 1> /dev/null 2>&1; then 
	echo 'mkv/MKV extension found'
	#create folders for the information package
	mkdir mkv_ip
	mkdir metadata_mkv
	mkdir objects_mkv 
	#extract metadata using mediainfo and export to txt and xml files
	for file in *.mkv; do mediainfo -f "$file" >"metadata_mkv/${file%.mkv}.mkv.txt"; done
	for file in *.MKV; do mediainfo -f "$file" >"metadata_mkv/${file%.MKV}.mkv.txt"; done
	for file in *.mkv; do mediainfo -f --Output=XML "$file" >"metadata_mkv/${file%.mkv}.mkv.xml"; done
	for file in *.MKV; do mediainfo -f --Output=XML "$file" >"metadata_mkv/${file%.MKV}.mkv.xml"; done
	#move mkv files to the objects_mkv folder
	mv *.mkv ./objects_mkv
	mv *.MKV ./objects_mkv
	#move and rename folders to create the information package
	mv metadata_mkv mkv_ip
	mv objects_mkv mkv_ip
	mv mkv_ip/metadata_mkv mkv_ip/metadata
	mv mkv_ip/objects_mkv mkv_ip/objects
   #ifiscripts is a dependency
 	manifest.py -s mkv_ip/objects
else
	echo 'no files with mkv/MKV extension found in current directory'
fi

#mxfs
#check if mxf extensions present. if so create information package that includes extracted .txt and .xml mediainfo files.
if ls *.mxf 1> /dev/null 2>&1 || ls *.MXF 1> /dev/null 2>&1; then 
	echo 'mxf/MXF extension found'
	#create folders for the information package
	mkdir mxf_ip
	mkdir metadata_mxf
	mkdir objects_mxf 
	#extract metadata using mediainfo and export to txt and xml files
	for file in *.mxf; do mediainfo -f "$file" >"metadata_mxf/${file%.mxf}.mxf.txt"; done
	for file in *.MXF; do mediainfo -f "$file" >"metadata_mxf/${file%.MXF}.mxf.txt"; done
	for file in *.mxf; do mediainfo -f --Output=XML "$file" >"metadata_mxf/${file%.mxf}.mxf.xml"; done
	for file in *.MXF; do mediainfo -f --Output=XML "$file" >"metadata_mxf/${file%.MXF}.mxf.xml"; done
	#move mxf files to the objects_mxf folder
	mv *.mxf ./objects_mxf
	mv *.MXF ./objects_mxf
	#move and rename folders to create the information package
	mv metadata_mxf mxf_ip
	mv objects_mxf mxf_ip
	mv mxf_ip/metadata_mxf mxf_ip/metadata
	mv mxf_ip/objects_mxf mxf_ip/objects
  #ifiscripts is a dependency
 	manifest.py -s mxf_ip/objects
else
	echo 'no files with mxf/MXF extension found in current directory'
fi

#m4as
#check if m4a extensions present. if so create information package that includes extracted .txt and .xml mediainfo files.
if ls *.m4a 1> /dev/null 2>&1 || ls *.M4A 1> /dev/null 2>&1; then 
	echo 'm4a/M4A extension found'
	#create folders for the information package
	mkdir m4a_ip
	mkdir metadata_m4a
	mkdir objects_m4a 
	#extract metadata using mediainfo and export to txt and xml files
	for file in *.m4a; do mediainfo -f "$file" >"metadata_m4a/${file%.m4a}.m4a.txt"; done
	for file in *.M4A; do mediainfo -f "$file" >"metadata_m4a/${file%.M4A}.m4a.txt"; done
	for file in *.m4a; do mediainfo -f --Output=XML "$file" >"metadata_m4a/${file%.m4a}.m4a.xml"; done
	for file in *.M4A; do mediainfo -f --Output=XML "$file" >"metadata_m4a/${file%.M4A}.m4a.xml"; done
	#move m4a files to the objects_m4a folder
	mv *.m4a ./objects_m4a
	mv *.M4A ./objects_m4a
	#move and rename folders to create the information package
	mv metadata_m4a m4a_ip
	mv objects_m4a m4a_ip
	mv m4a_ip/metadata_m4a m4a_ip/metadata
	mv m4a_ip/objects_m4a m4a_ip/objects
 #ifiscripts is a dependency
 	manifest.py -s m4a_ip/objects
else
	echo 'no files with m4a/M4A extension found in current directory'
fi

echo 'THIS SCRIPT IS NOT RECURSIVE'
