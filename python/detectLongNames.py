#!/usr/bin/env python3

#Script (in progress) to detect filenames with long paths before transferring to NTFS volumes.

#Dependencies: argparse, pathlib, python3.6 or above, csv

#Assumptions:
# 1. Destination is an NTFS volume with a 255-character cap on paths
# 2. That the total path length calculated here will not be 100% accurate post-transfer (e.g., windows Path stuff; additional directories on destination, etc.)

from pathlib import Path, PurePath
import argparse, csv

def scanPath(inputDir): #'inputDir' here being the variable created in selectiveTruncator below
    startingPath = Path(inputDir)
    #startingPath = Path('/home/bcadmin/Desktop/test-data/objects')
    with open (csvOut, 'w') as f:
        writer = csv.writer(f)
        writer.writerow(['path','filename','extension','length'])
        for i in startingPath.rglob('*'):
            pathObj = i
            #print(pathObj) #Partial Sanity check. Comment this line when before putting into production.
            numChar = len(str(pathObj))
            #print(pathObj,numChar) #Partial sanity check. Comment this line before putting into production.
            if numChar <= 230: #change this number as needed (lower numbers for testing). Probably ~230 for NTFS.
                pass
            else:
                largeNum = numChar
                print("The full path length of " + pathObj.name+ " is ", largeNum) #Sanity check?
                writer.writerow([pathObj.parent,pathObj.name,pathObj.suffix,largeNum])



#scanPath('/home/bcadmin/Desktop/test-data/objects') #comment/delete when ready to remove
parser = argparse.ArgumentParser()
parser.add_argument("-o","--output", help="Path to and filename for the CSV to create.")
parser.add_argument("-d","--directory", help="Path to input directory.")
args = parser.parse_args()

if args.output:
    csvOut = args.output
if args.directory:
    inputDir = args.directory

scanPath(inputDir) #uncomment when ready
