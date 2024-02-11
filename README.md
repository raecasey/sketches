# repository 
## sorting scripts
### dsortinghat_jpeg.sh
identifies if there are any versions of jpeg files in the current directory.
packages them into an information package named ip_jpeg with extracted exiftool metadata files
this script requires user to be in the same directory as the jpeg files
this script is not recursive.
### dsortinghat_tiff.sh
identifies if there are any versions of tiff files in the current directory.
packages them into an information package named ip_tiff with extracted exiftool metadata files
this script requires user to be in the same directory as the tiff files
this script is not recursive.
### dsortinghat_dng.sh
identifies if there are any versions of dng files in the current directory.
packages them into an information package named ip_dng with extracted exiftool metadata files
this script requires user to be in the same directory as the dng files
this script is not recursive.
### dsortinghat_png.sh
identifies if there are any versions of png files in the current directory.
packages them into an information package named ip_png with extracted exiftool metadata files
this script requires user to be in the same directory as the png files
this script is not recursive.
### dsortinghat_iiq.sh
identifies if there are any versions of iiq files in the current directory.
packages them into an information package named ip_jpeg with extracted exiftool metadata files
this script requires user to be in the same directory as the iiq files
this script is not recursive.
## image resizing scripts
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
### dep_im_half.sh
batch script
halves the pixel height and width of all image files in current directory. 
this script requires user to cd into the same directory as the image files
this script is not recursive.
## info on dependencies
#### exiftool is dependency for
dsortinghat_jpeg.sh

dsortinghat_tiff.sh

dsortinghat_dng.sh

dsortinghat_png.sh

dsortinghat_iiq.sh

dsortinghat_av.sh

d_jpeg.mv.sh
#### fmpeg is a dependency for
dep_im_309h.sh

dep_im_309w.sh

dep_im_double.sh

dep_im_half.sh 
