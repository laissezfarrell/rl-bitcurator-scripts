#!/usr/bin/env python3

#Script (in progress) to report empty directories in an accession from Duke Photography

#Dependencies: argparse, pathlib, python3.6 or above, csv, datetime

# Pseudocode
# Function 1: findNextJob
# takes startingDirectory (input by user) and makes a list of all next level subdirectories (aka jobs)
# for each Job, calls subDirWalk

# Function 2: subdirWalk
# takes a job directory from findNextJob
# makes a list of each subdirectory of the Job
# for each subdirectory, makes a list of all files, counts these files, and aggregates their size, writing JOB, SUB, FileCount, AggregateSize to a CSV

import argparse, csv, datetime
from pathlib import Path, PurePath
from datetime import datetime

def findNextJob():
    #startingPath = Path(inputDir) #uncomment when ready for arguments
    startingPath = Path('/d/appraisal/UA2018-0007-sample/2003/data/objects/') #comment when ready for arguments
    csvOut = Path('/home/bcadmin/Desktop/test-data/empties-test.csv') #comment when ready for arguments       
    with open (csvOut, 'w') as m:
        writer = csv.writer(m)
        writer.writerow(['path','foldersize (bytes)'])    
        jobList = [x for x in startingPath.iterdir() if x.is_dir()] #create a list of the children directories in startingPath.
        for i in jobList:
            print("The next Job to process is ",i) #sanity check
            subDirList = [y for y in i.iterdir() if i.is_dir()] #create a list of the children directories of a given parent in JobList     
            for d in subDirList:
                operatingSub = Path(d)
                print("the next sub directory to process is ",operatingSub)#sanity check
                fileList = list(operatingSub.glob('**/*'))
                folderSize = 0
                for f in fileList:
                    fSizeBytes = (Path.stat(f).st_size)
                    folderSize = folderSize + fSizeBytes
            print("The folder ",operatingSub," is ",folderSize)
            writer.writerow([operatingSub,folderSize])

findNextJob()

#2021-06-23 midday 3: making the below edits results in a script tha truns and produces an output that is expected (multiple lines). Problems:, 1) I think it's only reporting directories that are full, not doing anything with empty directories, and 2) it sometimes reports out abuot individual files (.jpgs) and reports those as empty. Committing this file for versioning, but am returning to the drawing board...trying to iterate down to the lowest level and then detect whether a file is full or empty.

#2021-06-23 midday2: moving all writing to second function at least creates the column labels, but still only includes 2 lines of output (the labels, the last piece of data). Consider moving all of this into one function, since I believe the second function, called by the first, overwrites itself each time. Committing this version so I can pull it back if needed.

#2021-06-23 midday: followed my leads from the end of day note below, and resulted in code that at least runs without error. Problem is, it overwrites itself in the CSV output, so the result is a one-line CSV only reporting the last directory's size. It's also writing over the column labels, which I think is because i'm calling the method twice (once in each function). Editing that out for now, and moving all writing activity to the second function

# 2021-06-22 end of day: Currently, the functions will run, but the script breaks when trying to write to the CSV file...I believe it's because the writing happens globally, but doesn't have access to the outputs of the functions. The most recent error is "operatingSub is not defined," which makes sense...operatingSub is a variable of subDirWalk, and the csv writing is happening outside of the function. NEXT: add print statements as sanity checks to make sure the script is calculating the other information I want. THEN: figure out how to make the output write. (maybe try moving lines 41 and 43-45 into 'findNextJob', copy 44 (maybe editing the 'writer' variable into something else to avoid collision) into subDirWalk, and move 45 into subDirWalk). findnextJob would start the CSV and subDirWalk would continue it--DONE