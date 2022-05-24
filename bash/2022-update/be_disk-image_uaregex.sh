#!/bin/bash

# Very basic shell script to run bulk_extractor over every disk image in a directory.
# The syntax of the bulk_extractor command is for bulk_extractor 2.x
# The output path is optimized for a shared directory between a Docker container and host machine, but since every linux box has a /home/ folder, this may be used on a linux desktop as well

unset a i
while IFS= read -r -u3 -d $'\0' file; do
    bulk_extractor -S ssn_mode=1 -e outlook -x zip -x rar -x winpe -x exif -o /home/reports/be-out/"$file"_beout/ "$file" -F /home/rl-bitcurator-scripts/be_regex/uaregex.txt
done 3< <(find $@ -maxdepth 1 -type f -print0)
