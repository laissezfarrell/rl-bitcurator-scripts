#!/usr/bin/env python3

#Script (in progress) to report high-level folder information for offices transferring records to the University Archives.

#Dependencies: argparse, pathlib, python3.6 or above, csv


import argparse, csv, datetime
from pathlib import Path, PurePath

def walkPath():
    startingPath = Path(inputDir) #uncomment when ready for arguments
    #csvOut = Path('/home/bcadmin/Desktop/accession-report-test.csv')
    #startingPath = Path('/home/bcadmin/Desktop/test-data/objects') #comment when ready for arguments
    spChild = [x for x in startingPath.iterdir() if x.is_dir()] #create a list of the children directories in startingPath.
    #with open (csvOut, 'w') as m:
    #    writer = csv.writer(m)
    #    writer.writerow(['path','foldersize '+ labelUnits,'Earliest Timestamp','Latest Timestamp'])
        for i in spChild:
            i = [y for y in spChild.iterdir() if y.isdir()] #create a list of children directories in i
# keep going here next. Handwritten notes for the pseudocode



    #        operatingDirectory = Path(i)
    #        print("the next directory to process is ",operatingDirectory)#sanity check
    #        fileList = list(operatingDirectory.glob('**/*'))
            #fileList = [x for x in operatingDirectory.iterdir() if x.is_file()]
            #print(fileList) #sanity check
    #        folderSize = 0
    #        fModTime = datetime.now()
    #        oldestTime = fModTime
    #        newestTime = datetime.strptime("Jan 01 1950", "%b %d %Y")
    #        for f in fileList:
    #            fSizeBytes = (Path.stat(f).st_size / repUnits)
    #            folderSize = folderSize + fSizeBytes
    #            fModTime = datetime.fromtimestamp(Path.stat(f).st_mtime)
    #            if fModTime >= oldestTime:
    #                pass
    #            else:
    #                oldestTime = fModTime
    #                if fModTime <= newestTime:
    #                    pass
    #                else:
    #                    newestTime = fModTime
            #print(folderSize)
            #print(oldestTime)
            #print(newestTime)
    #        writer.writerow([i,folderSize,oldestTime,newestTime])

# Main body to accept arguments and call the three functions.
parser = argparse.ArgumentParser()
parser.add_argument("output", help="Path to and filename for the CSV to create.")
parser.add_argument("input", help="Path to input directory.")
parser.add_argument("-u", "--units", type=str, choices=["b", "kb", "mb", "gb"], help="Unit of measurement for reporting aggregate size")
args = parser.parse_args()

if args.output:
    csvOut = args.output
if args.input:
    inputDir = args.input
#if args.units == "kb":
#    repUnits = 1024
#    labelUnits = "(kilobytes)"
#    print("Reporting sizes in kilobytes")
#elif args.units == "mb":
#    repUnits = 1024*1024
#    labelUnits = "(megabytes)"
#    print("Reporting sizes in megabytes")
#elif args.units =="gb":
#    repUnits = 1024*1024*1024
#    labelUnits = "(gigabytes)"
#    print("Reporting sizes in gigabytes")
#elif args.units == "b":
#    repUnits = 1
#    labelUnits = "(bytes)"
#    print("Reporting sizes in bytes, the purest way to report sizes.")
#else:
#    repUnits = 1
#    labelUnits = "(bytes)"
#    print("Your inattentiveness leads Self to default to reporting size in bytes, the purest yet least human readable way to report sizes. Ha ha, puny human. Bow before Self, the mighty computer. 01000100 01000101 01010011 01010100 01010010 01001111 01011001 00100000 01000001 01001100 01001100 00100000 01001000 01010101 01001101 01000001 01001110 01010011 00101110")

walkPath()
