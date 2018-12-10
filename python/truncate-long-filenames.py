#!/usr/bin/env python3

#Script (in progress) to analyze and truncate filenames in long paths before transferring to NTFS volumes.

#Dependencies: argparse, pathlib, python3.6 or above, csv

#Assumptions:
# 1. Destination is an NTFS volume with a 255-character cap on paths
# 2. Truncating the filename will not greatly hinder interpretation of the file renamed, with the understanding that 'greatly' is a subjective term.
# 3. That the total path length calculated here will not be 100% accurate post-transfer (e.g., windows Path stuff; additional directories on destination, etc.)

from pathlib import Path, PurePath
import argparse, csv


# get all files in a directory and Identify the paths of problematic length
def scanPath(inputDir): #'inputDir' here being the variable created in selectiveTruncator below
    startingPath = Path(inputDir)
    for i in startingPath.rglob('*'):
        pathObj = i
        #print(pathObj) #Partial Sanity check. Comment this line when before putting into production.
        numChar = len(str(pathObj))
        #print(pathObj,numChar) #Partial sanity check. Comment this line before putting into production.
        if numChar <= 100: #change this number as needed (lower numbers for testing). Probably ~230 for NTFS.
            pass
        else:
            largeNum = numChar
            print("The full path length of " + pathObj.name+ " is ", largeNum) #Sanity check?
            renamer(pathObj)

#rename file
def renamer(pathObj):
    print(pathObj.stem)
    counter = 0
    while True:
        counter += 1
        newPath = pathObj.replace(pathObj.with_name('RLRENAMED''{0:03}'.format(counter)))
        #newPath = Path(pathObj.parent).joinpath("rlRenamed".format(counter), pathObj.suffix)
        #if not newPath.exists():
            #return newPath

#write the CSV

#Main Function
def scanTriageTrunc():
    parser = argparse.ArgumentParser()
    parser.add_argument("-d","--directory", required=False, help="Path to input directory. If unused, input will be current directory.")
    parser.add_argument("-o","--output", required=True, help="Path to and filename for output file. Required")
    args = parser.parse_args()

    if args.directory:
        inputDir = args.directory
    else:
        inputDir = Path.cwd()
    if args.output:
        outputFile = args.output

    #with open (outputFile, 'wb') as f:
        #writer = csv.writer(f)
        #writer.writerow(['path', 'origFname', 'newFname'])

    scanPath(inputDir)

scanTriageTrunc()
