
a=$1
b=3
if(( ${#a} < 8 ))
then
    b=0
elif (( `echo $a | grep -c -E "[0-9]+"` == 0 ))
then
     b=0
elif  (( `echo $a | grep -c -E "[@#$%&*=+-]+"` == 0 ))
then
     b=0
else
	for((i=0;i<${#a}-4;i++))
	do
		((j=i+4))
		if (( `grep -c -E ".*${a:$i:$j}.*" /usr/share/dict/american-english` >= 0 ))
		then
			b=0
		fi
	done
fi
if (($b==0))
then
	echo "Weak Password"
else
	echo "Strong Password"
fi

