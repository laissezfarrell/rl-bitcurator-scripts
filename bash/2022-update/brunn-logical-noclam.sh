#!/bin/bash

# Very basic shell script to run brunnhilde.py over every subdirectory in a directory, without recursing and without scanning for viruses.



for D in *; do
  brunnhilde.py -n "$D" /home/reports/brunn-out/${D// /}"_brunnout"
done
