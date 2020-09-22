#A simple script to open a CSV and print the paths and filenames from a desired path to it.
#Updated to Python3 5/8/2020

import os, csv, argparse
import datetime

parser = argparse.ArgumentParser()
parser.add_argument("-o","--output", help="Path to and filename for the CSV to create")
parser.add_argument("-d","--directory", help="Path to directory to list in the CSV")
args = parser.parse_args()


if args.output:
	#global csvOut
	csvOut = args.output
if args.directory:
	global inputDir
	inputDir = args.directory

with open (csvOut, 'w', newline='', encoding='utf-8') as f:
	writer = csv.writer(f)
	writer.writerow(['path','title','type','date','creator','rights','rights_note','aspace_id','identifier'])
	for path, dirs, files in os.walk(inputDir):
		for filename in files:
			full_path = os.path.join(path,filename)
			full_path = full_path.replace("\\","/")
			full_path = full_path.replace('F:/repo/rub/','/nas/rubenstein_archive/')
			#print filename
			#add additional text entensions here
			if '.txt' in filename or '.TXT' in filename or '.rtf' in filename or '.RTF' in filename or '.doc' in filename or '.DOC' in filename:
				type = 'text'
			#add some more common image extentions here
			elif '.JPG' in filename or '.jpg' in filename:
				type = 'image'
			else:
				type = 'TYPE?'
			#date stuff is returning too recent modified dates.....
			#date = os.path.getmtime(path)
			#date_human = datetime.datetime.fromtimestamp(int(date)).strftime('%Y-%m-%d')
			writer.writerow([full_path,filename,type])
