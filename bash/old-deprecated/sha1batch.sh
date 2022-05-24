#!/bin/bash

# Very basic shell script to run sha1deep over every subdirectory in a directory recursing and writing an output file at the directory level.

for D in *; do
  sha1deep -e -r -W ../administrative_metadata/"$D"_objects.sha1 $D 
done
