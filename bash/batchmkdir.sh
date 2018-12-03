#!/bin/bash

# Very basic shell script to run brunnhilde.py over every subdirectory in a directory, without recursing.

for D in *; do
  mkdir ../administrative_metadata/$D
done
