for dir in *;
do mv "$dir" `echo $dir | tr -cd 'A-Za-z0-9_.-'`;
done
