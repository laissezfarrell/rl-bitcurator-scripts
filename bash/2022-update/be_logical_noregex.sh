#!/bin/bash

# Very basic shell script to run bulk_extractor over every subfolder of logical files from the working directory.
# The syntax of the bulk_extractor command is for bulk_extractor 2.x
# The output path is optimized for a shared directory between a Docker container and host machine, but since every linux box has a /home/ folder, this may be used on a linux desktop as well

unset a i
for dir in *; do
    bulk_extractor -S ssn_mode=1 -e outlook -x zip -x rar -x winpe -x exif -o /home/reports/be-out/"$dir"_beout -R "$dir"
done
