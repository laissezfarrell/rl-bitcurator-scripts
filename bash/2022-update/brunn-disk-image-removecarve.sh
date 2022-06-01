#!/bin/bash

# Very basic shell script to run brunnhilde.py over a directory of disk images, removing the carved files at the end of the process

for file in *; do
  brunnhilde.py --hash sha1 -l -d -r "$file" /home/reports/brunn-out/
done
