a=$1;
if [ -d $a ]
then
	echo "Error: its a dirctory"
elif [ -f $a ]
then 
	if (( `file "$a" | grep -c -E 'archive'` > 0 ))
	then
		file-roller "$a"
	else
		echo "Error: not a archive file"
	fi
else
	echo "Error: Not a file or directory"
fi