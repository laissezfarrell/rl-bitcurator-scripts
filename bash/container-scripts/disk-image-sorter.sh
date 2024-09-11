#!/bin/bash

# Very basic shell script to prompt a user for a directory of disk images, run the file utility against that directory, sort the images depending on file's output, and report how many images were sorted into which category.

echo What is the directory from which to start?
read STARTDIR
DISKIMAGECOUNT=$(find $STARTDIR -type f |wc -l)
echo Sorting $DISKIMAGECOUNT disk image files found in $STARTDIR
mkdir $STARTDIR/pc
mkdir $STARTDIR/hfs
mkdir $STARTDIR/unidentified
for file in $STARTDIR/*; do
    if [ -f "$file" ]; then
        FILEOUT=$(file $file)
        if [[ $FILEOUT == *"DOS/MBR boot sector"* ]]; then
            mv $file $STARTDIR/pc/
            #echo Moved $file to PC directory
        elif [[ $FILEOUT == *"Macintosh HFS data"* ]]; then
            mv $file $STARTDIR/hfs/
            #cho Moved $file to HFS directory
        else
            mv $file $STARTDIR/unidentified/
            #echo Moved $file to Unidentified directory
        fi
    fi
done
PCDISKIMAGECOUNT=$(find $STARTDIR/pc/ -type f | wc -l)
HFSDISKIMAGECOUNT=$(find $STARTDIR/hfs/ -type f | wc -l)
SOMETHINGELSECOUNT=$(find $STARTDIR/unidentified/ -type f| wc -l)
echo Sorting completed with the following outcome: $PCDISKIMAGECOUNT PC-compatible disk images, $HFSDISKIMAGECOUNT HFS disk images, and $SOMETHINGELSECOUNT disk images that need further inspection.