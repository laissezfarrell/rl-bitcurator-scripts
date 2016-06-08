#!/bin/bash

# Very basic shell script to run bulk_extractor over every file in a directory,
# ignoring any subdirectories.

unset a i
while IFS= read -r -u3 -d $'\0' file; do
    bulk_extractor -o "$file"_beout $file
done 3< <(find $@ -maxdepth 1 -type f -print0)

