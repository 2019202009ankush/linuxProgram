read a
b=`xdg-mime query filetype "$a"`
echo "$b"
s=`grep "$b" defaults.list`
echo "$s"
A="$(cut -d'=' -f2 <<<"$s")"
B="$(cut -d'.' -f1 <<<"$A")"
echo "$B"
"$B" "$a"
