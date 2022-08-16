#/bin/bash

export PATH=$PATH:/c/Users/mjf33/AppData/Local/Programs/Git/mingw64/bin #will need to edit this line if using on different Windows machine. Can probably comment this line if running on Linux/Mac.
echo What is your token?
read TOKEN
# TOKEN=[your token here] -- note: if you'd rather not copy/paste your token every time you run the script, paste it here, and uncomment the line. If you do that, a) comment out lines 3 and 5, and b) don't share the script file publicly 
echo What is the File Tracker path?
read ftPATH
URLPATH=$(echo $ftPATH | sed 's/\//%2F/g')
#echo $URLPATH
echo Where should we save the output?
read OUTPUT
echo Querying File Tracker with this $URLPATH and writing to $OUTPUT
curl -H "Authorization: Bearer $TOKEN" -X 'GET' "https://file-tracker.lib.duke.edu/api/tracked_files?ddr_resources=true&folder=${URLPATH}&fields=id,path,sha1,fixity_checked_at" -H 'accept: text/csv' > $OUTPUT