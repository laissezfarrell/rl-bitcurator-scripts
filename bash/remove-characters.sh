for file in *;
do mv "$file" `echo $file | tr -cd 'A-Za-z0-9_.-'`;
done
