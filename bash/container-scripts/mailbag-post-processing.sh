#!/bin/bash
# Very basic shell script to prompt a user for a starting directory, an output directory, and then move various mailbagit files around based on that input.

echo What is the directory with your mailbagit output?
read STARTDIR
echo What is the desired destination path?
read OUTDIR
echo What is the SETID you wish to assign these?
read SETID
echo What is your administrative_metadata directory?
read ADMINMETADATA

mkdir -p $OUTDIR/$SETID/eml 
mkdir $OUDTIR/$SETID/attachments
mv $STARTDIR/data/eml $OUTDIR/$SETID/eml
mv $STARTDIR/data/attachments $OUTDIR/$SETID/attachments
mv $STARTDIR/mailbag.csv $OUTDIR/$SETID/mailbag.csv
mkdir -p $ADMINMETADATA/$SETID/
mv $STARTDIR"_errors" $ADMINMETADATA/$SETID
mv $STARTDIR"_warnings" $ADMINMETADATA/$SETID

echo Use copies have been moved to the appropriate SET ID folder, and the errors and warning have been moved to the collection administrative metadata folder. Please delete the remaining files created by mailbagit.

# First test: this script works, though does through the error ("mkdir: cannot create directory ‘/RLxxxxx-SET-0001_u/attachments’: No such file or directory"). This has to do with line 14 and maybe line 16 as well, but in any event the files move as expected. Keep an eye on this as testing progresses.

# Second test (over files arranged more typically to a processed collection--two MBOX files): this script works. Received the error message as above: "mkdir: cannot create directory '/RL01262-SET-0012_u/attachments': No such file or directory", though like the above test, the files were moved as expected. One wrinkle, and this may be because the EML directory has two subdirectories (one for each MBOX file), the mkdir command in line 13 created an EML folder and the mv command in line 15 moved the parent EML folder, so there was a nested EML within EML. This isn't a biggie, but notable. Consider editing lines 13-16 as needed if this persists for other collections. This collection also did not have any _warnings folder, so that threw an error, but totally fine because there weren't any to worry about.