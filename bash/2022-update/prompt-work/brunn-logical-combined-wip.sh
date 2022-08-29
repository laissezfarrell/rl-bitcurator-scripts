#!/bin/bash

# Very basic shell script to prompt a user for a starting directory, and then run brunnhilde.py over every immediat child directory, without recursing.

echo What is the directory from which to start?
read STARTDIR
echo Where should the reports be saved?
read OUTDIR
echo Run virus scan \(yes or no\)?
read VIRUS
echo Are these disk image or logical files \(image or logical\)?
read MODEL
echo Starting a batch operation at $STARTDIR and saving reports to $OUTDIR
if [ "$MODEL" == "logical" ]
then
  for D in $STARTDIR/*; do
    if [ "$VIRUS" == "yes" ]
    then
      brunnhilde.py --hash sha1 -l "$D" $OUTDIR/$(basename ${D// /})"_brunnout"
    elif [ "$VIRUS" == "no" ]
    then
      brunnhilde.py --hash sha1 -n "$D" $OUTDIR/$(basename ${D// /})"_brunnout-noclam"
    else
      echo "Virus input not valid. Answer yes or no next time."
    fi
  done  
elif [ "$MODEL" == "image" ]
then
  #mkdir $STARTDIR/use-copies #uncomment once we add rename to dockerfile
  for file in $STARTDIR/*; do
    brunnhilde.py --hash sha1 -l -d -n "$file" $OUTDIR/$(basename ${file// /})"_brunnout"
  done
  find $OUTDIR -type d -name "carved_files" -printf "/%P\n" | while read CARVE ; do DIR=$(dirname "$CARVE" );mv "$OUTDIR""$CARVE" "$OUTDIR""$DIR""$DIR"_export;done
  #find $OUTDIR -type d -name "*_brunnout_export" | rename 's/_brunnout_export/_files/g' #uncomment when we add rename to dockerfile
  #mv $OUTDIR/*/*_files/ $STARTDIR/use-copies/ #uncomment when we add rename to dockerfile
else 
  echo "Model input is not valid. Answer image or logical next time."
fi