#!/bin/bash

# Very basic shell script to run identify_filenames.py over every file in a directory,
# ignoring any subdirectories.

unset a i
while IFS= read -r -u3 -d $'\0' file; do
    python3 /home/bcadmin/Tools/bulk_extractor/python/identify_filenames.py --all --xmlfile "$file".xml --mactimes "$file"_beout "$file"_annofeatures
done 3< <(find $@ -maxdepth 1 -type f -print0)

