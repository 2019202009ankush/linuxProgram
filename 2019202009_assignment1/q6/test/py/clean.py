import re

file1 = open("filteredtext.txt") 
lines = file1.read()# Use this to read file content as a stream: 
lines = lines.lower()
lines = lines.split('\n')
id = 1
file2 = open("weka_input.arrf","a")
file2.write("@RELATION Knock Knock Jokes\n")
file2.write("@ATTRIBUTE id NUMERIC\n")
file2.write("@ATTRIBUTE knock STRING\n@DATA\n")


for l in lines[:-2]:
	l = re.sub(" ",";",l.strip())
	l = str(id)+","+l
	id+=1
	file2.write(l+"\n")
	print l
file2.close()
