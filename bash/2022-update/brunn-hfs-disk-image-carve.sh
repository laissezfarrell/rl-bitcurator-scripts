#!/bin/bash

# Very basic shell script to run brunnhilde.py over a directory of disk images with HFS file systems.

for file in *; do
  brunnhilde.py --hash sha1 -l -d --hfs --resforks "$file" /home/reports/brunn-out/
done
