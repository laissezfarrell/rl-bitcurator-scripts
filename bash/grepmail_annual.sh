#!/bin/bash

# Very basic shell script to grepmail an MBOX file or set of MBOX files into derivative MBOX files per year. Using the date the message was sent rather than received.

for F in *; do
  grepmail -d "before 1/1/2007" "$F" > ~/Desktop/grepmail-out/${F// /}"_before2007.mbox"
  grepmail -d 2007 "$F" > ~/Desktop/grepmail-out/${F// /}"_2007.mbox"
  grepmail -d 2008 "$F" > ~/Desktop/grepmail-out/${F// /}"_2008.mbox"
  grepmail -d 2009 "$F" > ~/Desktop/grepmail-out/${F// /}"_2009.mbox"
  grepmail -d 2010 "$F" > ~/Desktop/grepmail-out/${F// /}"_2010.mbox"
  grepmail -d 2011 "$F" > ~/Desktop/grepmail-out/${F// /}"_2011.mbox"
  grepmail -d 2012 "$F" > ~/Desktop/grepmail-out/${F// /}"_2012.mbox"
  grepmail -d 2013 "$F" > ~/Desktop/grepmail-out/${F// /}"_2013.mbox"
  grepmail -d 2014 "$F" > ~/Desktop/grepmail-out/${F// /}"_2014.mbox"
  grepmail -d 2015 "$F" > ~/Desktop/grepmail-out/${F// /}"_2015.mbox"
  grepmail -d 2016 "$F" > ~/Desktop/grepmail-out/${F// /}"_2016.mbox"
  grepmail -d 2017 "$F" > ~/Desktop/grepmail-out/${F// /}"_2017.mbox"
  grepmail -d 2018 "$F" > ~/Desktop/grepmail-out/${F// /}"_2018.mbox"
  grepmail -d 2019 "$F" > ~/Desktop/grepmail-out/${F// /}"_2019.mbox"
  grepmail -d 2020 "$F" > ~/Desktop/grepmail-out/${F// /}"_2020.mbox"
done
