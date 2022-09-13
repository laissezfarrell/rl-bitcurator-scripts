#!/usr/bin/env python3
import os, argparse
from pathlib import Path, PurePath
def main():
    
    dirName = inputDir;
    
    '''
        Get a list of empty directories in a directory tree
    '''
    
    # Create a List    
    listOfEmptyDirs = list()
    
    # Iterate over the directory tree and check if directory is empty.
    for (dirpath, dirnames, filenames) in os.walk(dirName):
        if len(dirnames) == 0 and len(filenames) == 0 :
            listOfEmptyDirs.append(dirpath)
    
    # Iterate over the empty directories and print it
    for elem in listOfEmptyDirs:
        print(elem)    
        
    print ("****************")
    listOfEmptyDirs = [dirpath for (dirpath, dirnames, filenames) in os.walk(dirName) if len(dirnames) == 0 and len(filenames) == 0]
    
    
    for elem in listOfEmptyDirs:
        print(elem)  
        
        
parser = argparse.ArgumentParser()
parser.add_argument("input", help="Path to input directory.")

args = parser.parse_args()

if args.input:
    inputDir = args.input
        
if __name__ == '__main__':
    main()
