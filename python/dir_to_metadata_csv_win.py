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
			full_path = full_path.replace("Y:","//oit-nas-fe11.oit.duke.edu/RL-Archive") # will have to update if your drive mapping is different
			#add additional text entensions here
			if '.txt' in filename or '.TXT' in filename or '.rtf' in filename or '.RTF' in filename or '.doc' in filename or '.DOC' in filename or '.DOCX' in filename or '.docx' in filename or '.PDF' in filename or '.pdf' in filename:
				type = 'text'
			#add some more common image extentions here
			elif '.JPG' in filename or '.jpg' in filename or '.jpeg' in filename or '.JPEG' in filename or '.PNG' in filename or '.png' in filename or '.GIF' in filename or '.gif' in filename or '.BMP' in filename or '.bmp' in filename or '.tif' in filename or '.TIF' in filename or '.TIFF' in filename or '.tiff' in filename or '.HEIC' in filename or '.heic' in filename or '.psd' in filename:
				type = 'image'
			elif '.XLSX' in filename or '.xlsx' in filename or '.xls' in filename or '.XLS' in filename or '.accdb' in filename or '.ACCDB' in filename:
				type = 'dataset'
			elif '.PPTX' in filename or '.pptx' in filename or '.PPT' in filename or '.ppt' in filename or '.html' in filename or '.php' in filename:
				type = 'interactiveResource'
			else:
				type = ''
			#date stuff is returning too recent modified dates.....
			#date = os.path.getmtime(path)
			#date_human = datetime.datetime.fromtimestamp(int(date)).strftime('%Y-%m-%d')
			writer.writerow([full_path,filename,type])
