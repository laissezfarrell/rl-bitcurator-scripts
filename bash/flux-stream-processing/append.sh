for f in *.log; 
	do printf '%s\n' "${f%.log}-MFM.log"; 
done
