#!/usr/bin/env python3

#Script (in progress) to report high-level folder information for offices transferring records to the University Archives.

#Dependencies: argparse, pathlib, python3.6 or above, csv, datetime

#Assumptions:
# 1.

import argparse, csv, datetime
from pathlib import Path, PurePath
from datetime import datetime

# Function 1: Walk a file tree, identifying the folders therein
def walkPath():
    #startingPath = Path(inputDir) #uncomment when ready for arguments
    startingPath = Path('/home/bcadmin/Desktop/test-data/objects') #comment when ready for arguments
    spChild = [x for x in startingPath.iterdir() if x.is_dir()] #create a list of the children directories in startingPath.
    for i in spChild:
        operatingDirectory = Path(i)
        print("the next directory to process is ",operatingDirectory)#sanity check
        #fileList = list(operatingDirectory.glob('**/*'))
        fileList = [x for x in operatingDirectory.iterdir() if x.is_file()]
        print(fileList) #sanity check
        folderSize = 0
        fModTime = datetime.now()
        oldestTime = fModTime
        newestTime = datetime.strptime("Jan 01 1950", "%b %d %Y")
        for f in fileList:
            fSizeBytes = Path.stat(f).st_size
            folderSize = folderSize + fSizeBytes
            fModTime = datetime.fromtimestamp(Path.stat(f).st_mtime)
            if fModTime >= oldestTime:
                pass
            else:
                oldestTime = fModTime
            if fModTime <= newestTime:
                pass
            else:
                newestTime = fModTime
        print(folderSize)
        print(oldestTime)
        print(newestTime)
        with open (csvOut, 'w') as f:
            writer = csv.writer(f)
            writer.writerow(['path','foldersize','Earliest Timestamp','Latest Timestamp'])
            writer.writerow([i,folderSize,oldestTime,newestTime])

#end of day May 15: above function calculates the size of the files in a folder, as well as the most recent and oldest date modified. Next steps: 1) add arguments back in and test function. Mostly compied/pasted writer stuff from another script, so potentially doesn't work yet.



#realTime = datetime.datetime.fromtimestamp(Path.stat(i).st_mtime)
#print(realTime)
#print(Path.stat(i).st_size)
# Function 2: Summarize basic information about the contents of the folders identified in Function 1, including aggregate size, number of files (?), and modified date range.

# Function 3: Create a CSV file including the outputs of FUNCTION 1 and FUNCTION 2

# Main body to accept arguments and call the three functions.
#parser = argparse.ArgumentParser()
#parser.add_argument("-o","--output", help="Path to and filename for the CSV to create.")
#parser.add_argument("-d","--directory", help="Path to input directory.")
#args = parser.parse_args()

#if args.output:
    #csvOut = args.output
#if args.directory:
    #inputDir = args.directory

# function calls go here

walkPath()
