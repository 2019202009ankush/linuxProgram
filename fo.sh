#!/bin/bash
echo "enter file name"
read p
file "$p">out.txt
a=$(grep 'ASCII text' out.txt|wc -l)
a1=$(grep 'PDF' out.txt|wc -l)
a2=$(grep -E '(MPEG)|(flash)|(movie)|(3GPP)|(Media)|(Matroska)|(video)' out.txt|wc -l)
echo "$a2"
b="1"
if [ "$a" -eq 1 ];
then
	 gedit "$p"
elif [ "$a1" -eq 1 ];
then
	 firefox "$p"
elif [ "$a2" -eq 1 ];
then
	 vlc "$p"
fi
