# rl-bitcurator-scripts
Some scripts (bash, python) developed to automate processes

**simgen_prod.sh** 
- works on ISO and E01 disk image files
- works with disk images featuring an ISO9660 filesystem
- output currently dumped to desktop
- outputs:
  - virus scan report (clamTK)
  - sdhash similarity digest
  - contents list
- *TO-DO:*
  - compatibility with IMG, DD file extension disk images
  - compatibility with FAT, NTFS, HFS+ filesystems
  - ability to work with disk image files that have been split or at least document that the user must stitch these together prior to running
 
**multifiwalk.sh**
- borrowed whole cloth from the [BitCurator Users Google Group (thanks, Kam!)] (https://goo.gl/n8kke7)
- output dumped into directory storing the disk images
- *TO-DO:*
  - once script for running bitcurator-reports in batch is created, modify to ensure outputs are what an be expected by bc-reports as input.

**multi_be.sh**
- modified from multifiwalk.sh (thanks, Kam!)
- output dumped into subdirectories storing the disk image
- *TO-DO:*
  - once script for running bitcurator-reports in batch is created, modify to ensure outputs are what an be expected by bc-reports as input.
  - modify to include the rlist.txt group of regular expressions to search.
 

**multi_annofeatures.sh**
- modified from multifiwalk.sh (thanks, Kam!)
- output dumped into subdirectories storing the disk image
- *TO-DO:*
  - once script for running bitcurator-reports in batch is created, modify to ensure outputs are what an be expected by bc-reports as input.

**rlist.txt**
- an evolving list of regular expressions common enough to RL that all bulk_extractor searches should search them
- may eventually split into one for UA and one for non-UA collections

**Planned Script(s)**
- a script to run BitCurator Reports on a batch of disk images

-6/8/2016
