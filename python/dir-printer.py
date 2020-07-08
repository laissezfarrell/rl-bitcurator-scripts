#!/usr/bin/env python3

#Script (in progress) to report high-level folder information for offices transferring records to the University Archives.

#Dependencies: argparse, pathlib, python3.6 or above, csv, datetime

#Assumptions:
# 1.

import argparse, csv, datetime
from pathlib import Path, PurePath
from datetime import datetime

def walkPath():
    startingPath = Path(inputDir) #uncomment when ready for arguments
    #csvOut = Path('/home/bcadmin/Desktop/accession-report-test.csv')
    #startingPath = Path('/home/bcadmin/Desktop/test-data/objects') #comment when ready for arguments
    spChild = [x for x in startingPath.iterdir() if x.is_dir()] #create a list of the children directories in startingPath.
    with open (csvOut, 'w') as m:
        writer = csv.writer(m)
        writer.writerow(['path'])
        for i in spChild:
            operatingDirectory = Path(i)
            print("the next directory to process is ",operatingDirectory)#sanity check
            writer.writerow([i])


#end of day May 15: above function calculates the size of the files in a folder, as well as the most recent and oldest date modified. Next steps: 1) add arguments back in and test function. Mostly compied/pasted writer stuff from another script, so potentially doesn't work yet.

# Main body to accept arguments and call the three functions.
parser = argparse.ArgumentParser()
parser.add_argument("output", help="Path to and filename for the CSV to create.")
parser.add_argument("input", help="Path to input directory.")
args = parser.parse_args()

if args.output:
    csvOut = args.output
if args.input:
    inputDir = args.input

walkPath()
