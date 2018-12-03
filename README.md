# rl-bitcurator-scripts
Some resources (bash, python) developed to use in BitCurator. Simple (too simple) bash scripts, mostly.

**bash/append.sh**
- appends text to a set of Kryoflux log filenames.
- used to differentiate different image logs when we create multiple disk images from the same stream files

**bash/batch_brunn.sh and batch_brunn-noclam.sh**
- runs Brunnhilde.py against all directories in a given directory with standard RL options
- -no-clam runs Brunnhilde.py without generating hashes or virus scans

**bash/batchmkdir.sh**
- simply makes a directory in the administrative_metadata folder for every directory in a given directory without recursing further.
- assumes you are following the basic dir structure for RL AIPs

**bash/sha1batch.sh**
- runs sha1deep over every subdirectory of a given directory, creating an output file at the subdirectory level in the administrative_metadata folder.
- assumes you are following the basic dir structure for RL AIPs

**bash/multifiwalk.sh**
- borrowed whole cloth from the [BitCurator Users Google Group (thanks, Kam!)] (https://goo.gl/n8kke7)
- output dumped into directory storing the disk images
- *TO-DO:*
  - once script for running bitcurator-reports in batch is created, modify to ensure outputs are what an be expected by bc-reports as input.

**bash/multi_be.sh**
- modified from multifiwalk.sh (thanks, Kam!)
- output dumped into subdirectories storing the disk image
- *TO-DO:*
  - once script for running bitcurator-reports in batch is created, modify to ensure outputs are what an be expected by bc-reports as input.
  - modify to include the regex group of regular expressions to search.
  - modify to include other customizations run in RL

**bash/multi_annofeatures.sh**
  - modified from multifiwalk.sh (thanks, Kam!)
  - output dumped into subdirectories storing the disk image
  - *TO-DO:*
    - once script for running bitcurator-reports in batch is created, modify to ensure outputs are what an be expected by bc-reports as input.

**be_regex/uaregex.txt**
  - starting list of regexes to run against all UA collections, looking for some types of FERPA and other sensitive data.
  - not exhaustive. Needs updating.

##### Deprecated or otherwise abandoned
**bash/simgen_prod.sh** -- Should be considered deprecated at this point (December 2018). May return to this at some point
- works with image files feat. ISO and E01 extensions
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
  - remove virus scan function (handled by Brunnhilde)

**regex/rlist.txt**
- an evolving list of regular expressions common enough to RL that all bulk_extractor searches should search them
- could serve as useful for testing, but otherwise, deprecated in favor of lists that can be used in different collection profiles.
