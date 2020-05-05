#echo "If you want to enter the coordinate press 1"
#echo "If you want to enter the city name enter 2"
#read a

if [ "$#" = 2 ]
then
	#echo "Enter lattitude"
	#read lat
	#echo "Enter longitude"
	#read long
	curl -s "https://darksky.net/forecast/"$1","$2"/us12/en" > out
	str=`grep -E -i -o "Feels Like:&nbsp;</span><span class=\"feels-like-text\">[0-9][0-9]" out`
  str2=`grep -E -i -o "summary swap.*" out`
  #echo "$str2"
  B="$(cut -d';' -f2 <<<"$str2")"
  B="$(cut -d'<' -f1 <<<"$B")"

	A="$(cut -d'>' -f3 <<<"$str")"
	echo "Temprature is $A*F and Weather is $B"
    
elif [ "$#" = 1 ]
then
      #echo "Enter city name"
      #read a
      str=`grep -E -i "\$1" coord.txt|head -1`
      lat="$(cut -d',' -f1 <<<"$str")"
      lon="$(cut -d',' -f2 <<<"$str")"
      # la=$(bc -l <<<"${lat}")
      # lo=$(bc -l <<<"${lon}")
      #echo "$lat $lon" 
      str=`curl -s "https://darksky.net/forecast/$lat,$lon/us12/en"`
       A="$(cut -d' ' -f4 <<<"$str")"
       curl -s "https://darksky.net$A" >out87
     # echo "$str $A"
      
  
     str=`grep -E -i -o "Feels Like:&nbsp;</span><span class=\"feels-like-text\">[0-9][0-9]*" out87`
     str2=`grep  -o -E '<span class="summary swap">...............................' out87`
     #echo "$str2"
     B="$(cut -d';' -f2 <<<"$str2")"
     B="$(cut -d'.' -f1 <<<"$B")"
	 # echo "$str $lat $lon"
	  A="$(cut -d'>' -f3 <<<"$str")"
	  echo "Temprature is $A*F and Weather is $B"
else
   echo "Please enter valid command line argument"
fi      
