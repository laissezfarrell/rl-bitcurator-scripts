#!/bin/bash

# Very basic shell script to run brunnhilde.py over every subdirectory in a directory, without recursing.

#unset a i
#while IFS= read -r -u3 -d $'\0' d; do
#    brunnhilde.py --hash sha1 -l ./objects/$d ~/Desktop/brunn-out "$d"
#done 3< <(find $@ -maxdepth 1 -type f -print0)

for D in *; do
  brunnhilde.py -n $D ~/Desktop/brunn-out/ $D"_brunn-simple"
done
