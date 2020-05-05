s=$1
if [ "$2" = "all" ]
then
	 for i in `ls "$s"`
	 do
         ss=`file -v "$i"`
         #echo "$s"
        if [ "$ss" = "directory" ]
         then
                  sss="$s"
                  sss+="/"
                  sss+="$i"
         	 `./2.sh "$sss" all`
        else
       	ext="${i##*.}"
       	if [  "${s:0:1}" = "/" ]
       	then 
              v="$s"
              v+="/"
       	      v+="$ext"
              
       	else
       		v="$PWD"
                v+="/"
                v+="$s"
       		v+="/"
       		v+="$ext"
       	fi
       	#echo PKB $v
        if [ ! -d "$v" ]
   	    then
   	      mkdir "$v"
   	     fi
   	     find "$s" \( -name "*.*$ext*" \) -exec mv -n -t "$v" {} +
           
       fi
      done

else
for ext in "${@:2}"
do
     if [  "${s:0:1}" = "/" ]
       	then  
              v="$s"
              v+="/"
       	      v+="$ext"
       	else
                
       		v="$PWD"
                v+="/"
                v+="$s"
       		v+="/"
       		v+="$ext"
       	fi
       	
        if [ ! -d "$v" ]
   	    then
   	      mkdir "$v"
   	     fi
   	     find "$s" \( -name "*.*$ext*" \) -exec mv -n -t "$v" {} +
           
       
done
fi
