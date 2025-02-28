weakString="Weak Password"
strongPassword="Strong Password"
 
isWeakPassword() {
    password=$1
   
    #Minimum length of 8 characters
    if [ ${#password} -lt 8 ]
    then
        echo "$password: $weakString"
        return
    fi
   
    #Must contain at least one numeric character
    if [ `echo $password | grep -c -E "[0-9]+"` -eq 0 ]
    then
        echo "$password: $weakString"
        return 
    fi
   
    #Must contain at least one of the following non-alphabetic characters: @, #, $, %, &, *, +, -, =
    if [ `echo $password | grep -c -E "[@#$%&*=+-]+"` -eq 0 ]
    then
        echo "$password: $weakString"
        return 
    fi
   
    #Do a dictionary check on every sequence of at least four consecutive alphabetic characters in the password under test. This will eliminate passwords containing embedded "words" found in a standard dictionary.
    for((i=4;i<=${#password};i++))
    do
        for((j=0;j<=${#password}-$i;j++))
        do
            if [ `grep -c -E "^${password:$j:$i}$" dictionary.txt` -gt 0 ]
            then
                echo "$password: $weakString"
                return
            fi
        done
    done
   
    #All checks done.
    echo "$password: $strongPassword"
}
 
while [ ${#1} -gt 0 ]
do
    isWeakPassword $1
    shift 1
done
