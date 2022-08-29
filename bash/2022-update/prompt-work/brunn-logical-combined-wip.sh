#!/bin/bash

# Very basic shell script to prompt a user for a starting directory, and then run brunnhilde.py over every immediat child directory, without recursing.

echo What is the directory from which to start?
read STARTDIR
echo Where should the reports be saved?
read OUTDIR
echo Run virus scan (yes or no)?
read VIRUS
echo Starting a batch operation at $STARTDIR and saving reports to $OUTDIR
for D in $STARTDIR; do
  if $VIRUS == "yes"
  then
    brunnhilde.py --hash sha1 -l "$D" $OUTDIR/${D// /}"_brunnout"
  elif $VIRUS == "no"
  then
    brunnhilde.py --hash sha1 -l "$D" $OUTDIR/${D// /}"_brunnout"
done
