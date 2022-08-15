#!/bin/bash

# Very basic shell script to run brunnhilde.py over every subdirectory in a directory, without recursing.


for D in *; do
  brunnhilde.py --hash sha1 -l "$D" /home/reports/brunn-out/
done
