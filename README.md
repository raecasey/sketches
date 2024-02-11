# repository
## exiftool is dependency for
d_jpeg_ipsort

d_jpeg.mv.sh
## fmpeg is a dependency for
dep_im_309h.sh

dep_im_309w.sh

dep_im_double.sh

dep_im_half.sh  
### d_jpeg_ipsort
identifies if there are any versions of jpeg files in the current directory.
packages them into an information package named ip_jpeg with extracted exiftool metadata files
this script requires user to be in the same directory as the jpeg files
this script is not recursive. 
### dep_im_309h.sh
batch script
resizes all image files in current directory to the height of 309 pixels. 
the width will resize to match the height/width ratio of the original.
this script requires user to cd into the same directory as the image files
this script is not recursive.
### dep_im_309w.sh
batch script
resizes all image files in current directory to the width of 309 pixels. 
the height will resize to match the height/width ratio of the original.
this script requires user to cd into the same directory as the image files
this script is not recursive.
### dep_im_double.sh
batch script
doubles the pixel height and width of all image files in current directory. 
this script requires user to cd into the same directory as the image files
this script is not recursive.
# dep_im_half.sh
batch script
halves the pixel height and width of all image files in current directory. 
this script requires user to cd into the same directory as the image files
this script is not recursive.
