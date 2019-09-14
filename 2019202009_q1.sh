echo "If you want to enter the coordinate press 1"
echo "If you want to enter the city name enter 2"
read a
if [ $a = 1 ]
then
	echo "Enter lattitude"
	read lat
	echo "Enter longitude"
	read long
	curl -s "https://darksky.net/forecast/$lat,$long/us12/en" > out
	str=`grep -E -i -o "Feels Like:&nbsp;</span><span class=\"feels-like-text\">[0-9][0-9]" out`
	A="$(cut -d'>' -f3 <<<"$str")"
	echo "Temprature is $A*F"
    
else
      echo "Enter city name"
      read a
      str=`grep -E -i "\$a" coord.txt|head -1`
      lat="$(cut -d',' -f1 <<<"$str")"
      lon="$(cut -d',' -f2 <<<"$str")"
      # la=$(bc -l <<<"${lat}")
      # lo=$(bc -l <<<"${lon}")
      echo "$lat $lon" 
      str=`curl -s "https://darksky.net/forecast/$lat,$lon/us12/en"`
       A="$(cut -d' ' -f4 <<<"$str")"
       curl -s "https://darksky.net$A" >out87
     # echo "$str $A"
      
  
     str=`grep -E -i -o "Feels Like:&nbsp;</span><span class=\"feels-like-text\">[0-9][0-9]*" out87`
	 # echo "$str $lat $lon"
	  A="$(cut -d'>' -f3 <<<"$str")"
	  echo "Temprature is $A*F"
fi      
