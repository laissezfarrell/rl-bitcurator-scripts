#!/bin/bash

# Script to prompt user for input directory and then iterate over the .boxnote files in that directory, calling a python script to migrate those .boxnote files into DocX and HTML versions.

# Currently written to work specifically on lib-sce-rub02, which already has the dependencies installed. If this becomes a process that is needed more regularly, then will look to generalizing it (which would at least include learning more about the poetry dependency manager)

echo What is your input directory?
read INDIR
IFS=$'\n'
for file in $INDIR/*.boxnote; do
    cd /media/data/shared-user-files/boxnote-converter/
    poetry run python boxnote-converter/docx_parser.py $file -d $INDIR -o $file"_converted"
done

#this works for "new style" boxnotes (August 2022-present). Though the docx conversion breaks when there is supposed to be an image included. The HTML conversion is created, but the image is not included.

#it breaks on "old style" boxnotes.