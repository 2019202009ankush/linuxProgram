
if [ "$#" != 1 ]
then
	echo "please provide one commnad line argument"
	exit
fi

s=$1;
if [ -d $s ]
then
	echo "Error: its a dirctory"
elif [ -f $s ]
then 
	a=$(basename "$s")
    #echo $a
	if [ "$a" = *.zip ]; 
	then unzip "$s" 
    elif [ "$a" = *.tar.gz ];
    then tar xzf "$s"
    elif [ "$a" = *.tar.bz2 ];
    then tar xjf "$s"
    elif [ "$a" = *.tar ];
    then tar xf "$s"
    elif [ "$a" = *.tbz2 ];
    then tar xjf "$s"
    elif [ "$a" = *.tgz ];
    then tar xzf "$s"
    elif [ "$a" = *.Z ];
    then uncompress "$s"
    elif [ "$a" = *.rar ];
    then rar x "$s"
    elif [ "$a" = *.jar ];
    then jar -xvf "$s"
    elif [ "$a" = *.gz ];
    then gunzip "$s"
    elif [ "$a" = *.bz2 ];
    then bunzip2 "$s"
    elif [ "$a" = *.tar.xz ];
    then tar -xf "$s"
    elif [ "$a" = *.7z ];
    then 7z x "$s"
    else
        echo "no match"
    fi

else
	echo "Error: please give a valid file name"
fi