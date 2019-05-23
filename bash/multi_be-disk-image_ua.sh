#!/bin/bash

# Very basic shell script to run bulk_extractor over every file in a directory,
# ignoring any subdirectories.

unset a i
while IFS= read -r -u3 -d $'\0' file; do
    bulk_extractor -S ssn_mode=1 -S jpeg_carve_mode=0 -S unzip_carve_mode=0 -S unrar_carve_mode=0 -S winpe_carve_mode=0 -e facebook -e outlook -o ~/Desktop/be-out/"$file"_beout/ $file -F /home/bcadmin/rl-bitcurator-scripts/be_regex/uaregex.txt
done 3< <(find $@ -maxdepth 1 -type f -print0)
