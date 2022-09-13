#!/usr/bin/env python3
import os
def main():
    
    dirName = '/d/new-acquisition/saf_accession/objects'; #edit this until I add variable prompt
    
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
        
        
        
if __name__ == '__main__':
    main()