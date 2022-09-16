#!/bin/bash

# Very basic shell script to run bulk_extractor over every subfolder of files from the working directory.
# The syntax of the bulk_extractor command is for bulk_extractor 1.x

echo What is the directory from which to start?
read STARTDIR
echo Where should the reports be saved?
read OUTDIR
echo Are these disk image or logical files \(image or logical\)?
read MODEL
echo What regular expression file should be called \(ua or none\)?
read REGEX
#unset a i
if [ "$MODEL" == "logical" ]
then
    for dir in $STARTDIR/*; do
        if [ "$REGEX" == "none" ]
        then
            bulk_extractor -S ssn_mode=1 -S jpeg_carve_mode=0 -S unzip_carve_mode=0 -S unrar_carve_mode=0 -S winpe_carve_mode=0 -e outlook -o $OUTDIR/"$dir"_beout -R "$dir"
        elif [ "$REGEX" == "ua" ]
        then
            bulk_extractor -S ssn_mode=1 -S jpeg_carve_mode=0 -S unzip_carve_mode=0 -S unrar_carve_mode=0 -S winpe_carve_mode=0 -e facebook -e outlook -o $OUTDIR/"$dir"_beout -R "$dir" -F ~/rl-bitcurator-scripts/be_regex/uaregex.txt #this regex location assumes the script is running on one of the RLVM BitCurator instances. 
        else
            echo "Regex input not valid."
        fi
    done
elif [ "$MODEL" == "image" ]
then
    for file in $STARTDIR/*; do
        if [ "$REGEX" == "none" ]
        then
            #while IFS= read -r -u3 -d $'\0' file; do #fix this! This appears to call bulk-extractor from the working directory of the .sh file rather than the STARTDIR
            bulk_extractor -S ssn_mode=1 -S jpeg_carve_mode=0 -S unzip_carve_mode=0 -S unrar_carve_mode=0 -S winpe_carve_mode=0 -e outlook -o $OUTDIR/"$file"_beout/ "$file"
        elif [ "$REGEX" == "ua" ]
        then
            # while IFS= read -r -u3 -d $'\0' file; do
            bulk_extractor -S ssn_mode=1 -S jpeg_carve_mode=0 -S unzip_carve_mode=0 -S unrar_carve_mode=0 -S winpe_carve_mode=0 -e outlook -o $OUTDIR/"$file"_beout/ "$file" -F /home/bcadmin/rl-bitcurator-scripts/be_regex/uaregex.txt #this regex location assumes the script is running on one of the RLVM BitCurator instances. 
        else
            echo "Regex input not valid."
        fi
    done
else
      echo "Model input not valid."
fi
