#!/bin/bash

# Very basic shell script to run bulk_extractor over every folder in a directory,
# ignoring any subdirectories.

unset a i
for dir in *; do
    bulk_extractor -S ssn_mode=1 -S jpeg_carve_mode=0 -S unzip_carve_mode=0 -S unrar_carve_mode=0 -S winpe_carve_mode=0 -e facebook -e outlook -o ~/Desktop/be-out/"$dir"_beout -R $dir -F ~/rl-bitcurator-scripts/be_regex/uaregex.txt
done
