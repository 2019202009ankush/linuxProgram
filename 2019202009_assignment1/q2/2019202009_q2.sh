
if [ "$#" = 1 ]
then
a=$1
if [ ! -f "$a" ]
then
    echo "File not exits in this directory."
    exit
fi
b=`xdg-mime query filetype "$a"`
     if [ "$b" = "application/x-shellscript" ]
     then
	      vim "$a"
     else
          #echo "$b"
          s=`grep "$b" defaults.list`
          #echo "$s"
          A="$(cut -d'=' -f2 <<<"$s")"
          B="$(cut -d'.' -f1 <<<"$A")"
          #echo "$B"
	      dpkg -s "$B" &> /dev/null
	      if [ $? -eq 0 ]; 
	      then
          echo "$B is already installed and we are opening it"
          B+=" "
          B+="$a"
          eval "$B"
          else
          echo "Error Package is not installed Please install $B"
           B+=" "
          B+="$a"
          eval "$B"
           
          fi
      fi
else
	echo "Please enter a file name"
fi
