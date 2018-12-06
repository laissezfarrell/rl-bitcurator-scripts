#!/usr/bin/python3

#Script (in progress) to analyze and truncate filenames in long paths before transferring to NTFS volumes.

#Dependencies: argparse, pathlib

#Assumptions:
# 1. Destination is an NTFS volume with a 255-character cap on paths
# 2. Truncating the filename will not greatly hinder interpretation of the file renamed, with the understanding that 'greatly' is a subjective term.
# 3. That the total path length calculated here will not be 100% accurate post-transfer (e.g., windows Path stuff; additional directories on destination, etc.)

from pathlib import Path, PurePath
import argparse

#Functions

#calculate total path length

#determine which part of the path should be edited

#truncate/rename file

#Main section
