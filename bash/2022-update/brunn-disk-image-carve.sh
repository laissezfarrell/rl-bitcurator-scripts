#!/bin/bash

# Very basic shell script to run brunnhilde.py over a directory of disk images.


for file in *; do
  brunnhilde.py --hash sha1 -l -d "$file" /home/reports/brunn-out/
done
