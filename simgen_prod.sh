#!/bin/bash
#: Title    : SimGenVirusScan
#: Author   : "Matthew Farrell" <matthew.j.farrell@duke.edu>
#: Date     : 4/1/2015, 5/12/2015
#: Version  : 0.3
#: Descript : mount a directory of disk image files, print a simple contents list, run ClamTK, generate sdhash digests its contents, and unmount
#: Options  : 
#: Depends  : fuseiso, xmount, sdhash
#: License  : GPLv3

for file in *.{iso,E01}; do
if [[ $file =~ .*[.][eE]0[1234] ]]
then
    DIR="${file%.*}"
    mkdir -p /home/bcadmin/Desktop/image_mount/"$DIR"   
    sudo xmount --in ewf $file /home/bcadmin/Desktop/image_mount/"$DIR"
    mkdir /home/bcadmin/Desktop/image_mount/dd_"$DIR"
    sudo mount -t iso9660 -o loop /home/bcadmin/Desktop/image_mount/"$DIR"/"$DIR".dd /home/bcadmin/Desktop/image_mount/dd_"$DIR"
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
else echo "$file is not an ISO or E01 disk image!"
fi
done
