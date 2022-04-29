#!/bin/bash

# Basic shell script to rename carved_files folder post Brunnhilde.py

for D in *; do
  find . -type d -name "carved_files" -printf "/%P\n" | while read CARVE ; do DIR=$(dirname "$CARVE" );mv ."$CARVE" ."$DIR""$DIR"_export;done
  find . -type d -name "*_brunnout_export" | rename 's/_brunnout_export/_files/g'
done
