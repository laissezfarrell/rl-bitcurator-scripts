# -*- coding: utf-8 -*-
# A simple script to have the File Tracker API query DDR and report whether objects in FT also exist in DDR

import subprocess 

token = input("Paste your OAuth Token here: ")
ftParentPath = input("Paste your File Tracker path here: ")
outPath = input("Enter your output path and filename here: ")

subprocess.run('curl')


#leaving this aside for now, as pycurl doesn't seem to want to install in spyder and subprocess seems like overkill for what I need?