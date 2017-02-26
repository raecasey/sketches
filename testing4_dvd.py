#!/bin/bash 

if [ "${#}" = 0 ] ; then echo " drag and drop a file" ; exit
else


sourcepath="$(dirname "$1")" 
filename="$(basename "$1")"
filenoext="${filename%.*}"

echo "Would you like to burn straight to DVD Y or N?"
read "burn";

echo "BITC? Enter Y or N"
read "bitc";
if [[ "${bitc}" == "Y" || "${bitc}" == "y" ]] ; then
size=($(ffprobe -v error -select_streams v:0 -show_entries stream=height -of default=noprint_wrappers=1:nokey=1 "$1"))
	wsize=($(ffprobe -v error -select_streams v:0 -show_entries stream=width -of default=noprint_wrappers=1:nokey=1 "$1"))

	ycor=($(bc <<< $size/1.20))
	xcor=($(bc <<< $wsize/2))
	font=($(bc <<< $size/12))

	textoptions=("fontsize=$font:x=$xcor-text_w/2:y=$ycor")


framerate=($(ffprobe -v error -select_streams v:0 -show_entries stream=avg_frame_rate -of default=noprint_wrappers=1:nokey=1 "$1"))

#ffprobe -v error -select_streams v:0 -show_entries format_tags=timecode:stream_tags=timecode -of default=noprint_wrappers=1:nokey=1 B.mxf will print either/or. may be times where none exist.
tctest=($(ffprobe -v error -select_streams v:0 -show_entries format_tags=timecode:stream_tags=timecode -of default=noprint_wrappers=1:nokey=1 "$1")) 
tctest2=($(ffprobe -v error -select_streams v:0 -show_entries stream_tags=timecode -of default=noprint_wrappers=1:nokey=1 "$1"))
if [[ "${tctest}" == "" ]] ; then
	echo " no timecode present. manually create one with another tool. Sorry. I'll update this feature later. Your file is probably wonky, or maybe it's my script. Who knows?" ;exit
elif [[ "${tctest2}" == "" ]] ; then
	IFS=: read -a timecode < <(ffprobe -v error -show_entries format_tags=timecode -of default=noprint_wrappers=1:nokey=1 "$1")
else
	IFS=: read -a timecode < <(ffprobe -v error -show_entries stream_tags=timecode -of default=noprint_wrappers=1:nokey=1 "$1")

fi
		printf -v timecode "'%s\:%s\:%s\:%s'" "${timecode[@]}"
		echo "$timecode"

		drawtext_options=(
		    fontfile="/Library/Fonts/Arial Black.ttf"
		    fontcolor=white
		    timecode="$timecode"
		    rate="$framerate"
		    boxcolor=0x000000AA
		    box=1
			$textoptions
		    #x=360-text_w/2
		    #y=480
		)

		drawtext_options=$(IFS=:; echo "${drawtext_options[*]}")

export VIDEO_FORMAT=PAL
ffmpeg -i "$1" -vf drawtext="$drawtext_options" -target pal-dvd "$1"_dvd.mpg
mkdir "$sourcepath/$filenoext"
mkdir "$sourcepath/$filenoext/dvd"
dvdauthor -o "$sourcepath/$filenoext/dvd" -t "$1"_dvd.mpg
dvdauthor -o "$sourcepath/$filenoext/dvd" -T
mkisofs -dvd-video -V IFIARCHIVE -o "$1".iso "$sourcepath/$filenoext/dvd"

if [[ "${burn}" == "Y" || "${burn}" == "y" ]] ; then
	hdiutil burn "$1".iso
else
	exit
fi
		

else 

export VIDEO_FORMAT=PAL
ffmpeg -i "$1" -target pal-dvd "$1"_dvd.mpg
mkdir "$sourcepath/$filenoext"
mkdir "$sourcepath/$filenoext/dvd"
dvdauthor -o "$sourcepath/$filenoext/dvd" -t "$1"_dvd.mpg
dvdauthor -o "$sourcepath/$filenoext/dvd" -T
mkisofs -dvd-video -V IFIARCHIVE -o "$1".iso "$sourcepath/$filenoext/dvd"

if [[ "${burn}" == "Y" || "${burn}" == "y" ]] ; then
	hdiutil burn "$1".iso
else
	exit
fi
fi
fi
