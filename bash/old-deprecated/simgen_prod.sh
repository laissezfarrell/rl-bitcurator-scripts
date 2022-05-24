#!/bin/bash
#: Title    : SimGenProd
#: Author   : "Matthew Farrell" <matthew.j.farrell@duke.edu>
#: Date     : 4/1/2015, 5/12/2015, 6/30/2016
#: Version  : 0.4
#: Descript : mount a directory of disk image files, print a simple contents list, run ClamTK, generate sdhash digests its contents, and unmount
#: Options  : 
#: Depends  : fuseiso, xmount, sdhash
#: License  : GPLv3

for file in *.{iso,E01,img,dd}; do
if [[ $file =~ .*[.][eE]0[1234] ]]
then
    DIR="${file%.*}"
    mkdir -p /home/bcadmin/Desktop/image_mount/"$DIR"   
    sudo xmount --in ewf $file /home/bcadmin/Desktop/image_mount/"$DIR"
    mkdir /home/bcadmin/Desktop/image_mount/dd_"$DIR"
    sudo mount -t iso9660 -o loop /home/bcadmin/Desktop/image_mount/"$DIR"/"$DIR".dd /home/bcadmin/Desktop/image_mount/dd_"$DIR" || sudo mount -t vfat -o ro,loop /home/bcadmin/Desktop/image_mount/"$DIR"/"$DIR".dd /home/bcadmin/Desktop/image_mount/dd_"$DIR" || sudo mount -t ntfs -o ro,loop /home/bcadmin/Desktop/image_mount/"$DIR"/"$DIR".dd /home/bcadmin/Desktop/image_mount/dd_"$DIR" || sudo mount -t hfsplus -o ro,loop /home/bcadmin/Desktop/image_mount/"$DIR"/"$DIR".dd /home/bcadmin/Desktop/image_mount/dd_"$DIR"
    ls -R /home/bcadmin/Desktop/image_mount/dd_"$DIR"/
    find /home/bcadmin/Desktop/image_mount/dd_"$DIR"/ -maxdepth 15 -iname "*.*" -printf "%h,%f,%CY-%Cm-%Cd,%s\n" > /home/bcadmin/Desktop/"$DIR"_contents.csv
    clamscan -l /home/bcadmin/Desktop/"$DIR".txt -r /home/bcadmin/Desktop/image_mount/dd_"$DIR"/
    sdhash -r -o /home/bcadmin/Desktop/"$file" /home/bcadmin/Desktop/image_mount/dd_"$DIR"
    sudo umount /home/bcadmin/Desktop/image_mount/dd_"$DIR"
    sudo umount /home/bcadmin/Desktop/image_mount/"$DIR"
    rmdir /home/bcadmin/Desktop/image_mount/dd_"$DIR"
    rmdir /home/bcadmin/Desktop/image_mount/"$DIR"
elif [[ $file =~ .*[.](iso|ISO)\d? ]]
then
    DIR="${file%.*}"
    mkdir -p /home/bcadmin/Desktop/image_mount/"$DIR"
    fuseiso -p $file /home/bcadmin/Desktop/image_mount/"$DIR"
    ls -R /home/bcadmin/Desktop/image_mount/"$DIR"
    find /home/bcadmin/Desktop/image_mount/"$DIR"/ -maxdepth 15 -iname "*.*" -printf "%h,%f,%CY-%Cm-%Cd,%s\n" > /home/bcadmin/Desktop/"$DIR"_contents.csv
    clamscan -l /home/bcadmin/Desktop/"$DIR".txt -r /home/bcadmin/Desktop/image_mount/"$DIR"/
    sdhash -r -o /home/bcadmin/Desktop/"$file" /home/bcadmin/Desktop/image_mount/"$DIR"
    fusermount -u /home/bcadmin/Desktop/image_mount/"$DIR"
elif [[ $file =~ .*[.](img|IMG|dd|DD) ]] #Added June 2016. Haven't actually tested it with a dd image from a non-optical disc. Optical dd images do not work with this script unless one changes their extensions to ISO.
then
    DIR="${file%.*}"
    mkdir -p /home/bcadmin/Desktop/image_mount/"$DIR"
    sudo mount -t vfat -o ro,loop $file /home/bcadmin/Desktop/image_mount/"$DIR" || sudo mount -t ntfs -o ro,loop $file /home/bcadmin/Desktop/image_mount/"$DIR" || sudo mount -t hfsplus -o ro,loop $file /home/bcadmin/Desktop/image_mount/"$DIR" || sudo mount -t iso9660 -o ro,loop /home/bcadmin/Desktop/image_mount/"$DIR"
    ls -R /home/bcadmin/Desktop/image_mount/"$DIR"/
    find /home/bcadmin/Desktop/image_mount/"$DIR"/ -maxdepth 15 -iname "*.*" -printf "%h,%f,%CY-%Cm-%Cd,%s\n" > /home/bcadmin/Desktop/"$DIR"_contents.csv
    clamscan -l /home/bcadmin/Desktop/"$DIR".txt -r /home/bcadmin/Desktop/image_mount/"$DIR"/
    sdhash -r -o /home/bcadmin/Desktop/"$file" /home/bcadmin/Desktop/image_mount/"$DIR"
    sudo umount /home/bcadmin/Desktop/image_mount/"$DIR"
    rmdir /home/bcadmin/Desktop/image_mount/"$DIR"
else echo "$file is not an ISO, IMG, or E01 disk image!"
fi
done
