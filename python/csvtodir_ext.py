#A simple script to open a CSV and print the paths and filenames from a desired path to it.
import os, csv, argparse

parser = argparse.ArgumentParser()
parser.add_argument("-o","--output", help="Path to and filename for the CSV to create")
parser.add_argument("-d","--directory", help="Path to directory to list in the CSV")
args = parser.parse_args()

if args.output:
	global csvOut
	csvOut = args.output
if args.directory:
	global inputDir
	inputDir = args.directory

with open (csvOut, 'wb') as f:
	writer = csv.writer(f)
	for path, dirs, files in os.walk(inputDir): 
		for filename in files:
			extension = os.path.splitext(filename)[1]
			writer.writerow([path,filename,extension])
		#for files in os.stat(inputDir): #trying to get other info out of this
			#writer.writerow([size,mtime]) #but it isn't working yet