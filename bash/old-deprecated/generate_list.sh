#generates mylist.txt files for later use in ffmpeg's concatenate function.
for d in $(find . -maxdepth 3 -type d); do
#	echo $d #sanity check
#	ls $d #sanity check
	for f in $d/*.{mts,mpg,m4v,mov}; do #extend with additional extensions as needed
		shopt -s nullglob #ignores extensions that are not present.
		shopt -s nocaseglob #ignores case
		echo "file '$f'" >> $d/mylist.txt
	done
done
