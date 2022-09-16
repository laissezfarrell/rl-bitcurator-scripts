#!/bin/bash

# Very basic shell script to run bulk_extractor over every subfolder of files from the working directory.
# The syntax of the bulk_extractor command is for bulk_extractor 2.x

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
            bulk_extractor -S ssn_mode=1 -e outlook -x zip -x rar -x winpe -x exif -o $OUTDIR/"$dir"_beout -R "$dir"
        elif [ "$REGEX" == "ua" ]
        then
            bulk_extractor -S ssn_mode=1 -e outlook -x zip -x rar -x winpe -x exif -o $OUTDIR/"$dir"_beout -R "$dir" -F /home/scripts/be_regex/uaregex.txt
        else
            echo "Regex input not valid."
        fi
    done
elif [ "$MODEL" == "image" ]
then
    if [ "$REGEX" == "none" ]
    then
        while IFS= read -r -u3 -d $'\0' file; do
        bulk_extractor -S ssn_mode=1 -e outlook -x zip -x rar -x winpe -x exif -o /home/reports/be-out/"$file"_beout/ "$file"
        done 3< <(find $@ -maxdepth 1 -type f -print0)
    elif [ "$REGEX" == "ua" ]
    then
        while IFS= read -r -u3 -d $'\0' file; do
        bulk_extractor -S ssn_mode=1 -e outlook -x zip -x rar -x winpe -x exif -o /home/reports/be-out/"$file"_beout/ "$file" -F /home/scripts/be_regex/uaregex.txt
        done 3< <(find $@ -maxdepth 1 -type f -print0)
    else
        echo "Regex input not valid."
    fi
else
      echo "Model input not valid."
fi
