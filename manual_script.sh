#! /bin/bash

# - single line comment

<<COMMENTNAME
this
is
multi-line
comment
COMMENTNAME

# print to term and write it to file
echo "hello bash!"
echo "hello bash!" > output.txt

# inquire for input -p - prompt and write it to variable $input
read -p "Type smth: " input
echo $input >> output.txt

# arithmetic operations ((in double- quotes))
num=10
echo $((num + 2))
echo $((num / 2))
echo $((num % 4))

echo $((++num)) # returns alrealy changer by +1 var
echo $num
echo $((num--)) # returns the former variable and then changes it
echo $num

let num=num+1
echo $((num /= 2)) # bash do only integers

# conditions
<<operators
-gt - >
-ge - >=
-lt - <
-le - <=
-eq - ==
||, -o - or
&&, -a - and
! - not
-z - length of the str is zero
-n - length is not zero
operators
count=11
if [ $count -eq 10 ]
then
    echo "wow"
elif (( $count > 10 ))
then
    echo "hello"
else
    echo "goodbye"
fi

if [ "abc" > "ab" ]
then
    echo "abc > ab"
fi

# while loop
num=1
while [ $num -le 3 ]
do
    echo "$num"
    ((num++))
done

# until loop
num=4
until [ $num -eq 6 ]
do
    echo "$num"
    ((num++))
done

<<ranges
1 2 3 4 - numeric range
{0..5} - range
{10..2..-2} - range with step, new version
$(seq 10 -2 2) - range with step, old version
ranges

# for loop
for i in {0..5}
do
    echo $i
done

# infinite loop
for ((i=0; ;i++))
do
    echo "inf"
    break
done

<<script_input
$0 - name of the script file
$1 - first argumant ...
$@ - list of all args
$# - length of its list
script_input

echo $0 $1 $2

# create the list of args
args=("$@")
echo ${args[0]} ${args[1]}
echo ${#args[@]} # type length

# set first param as input file, if
# nothing is provided, then use console as input
[ $1 ] && input=$1 || input="/dev/stdin"

# -f - if file exists returns true, false otherwise
if ! [ -f $input ]
then
    touch $input
fi

# read line-by-line from input file
while read line
do
    echo $line
done < $input
# ./manual.sh output.txt

# script output
# stdout goes to file1, error goes to file2
# error goes to terminal by default
ls -al 1>file1.txt 2>file2.txt
ls +al 1>>file1.txt 2>file2.txt
# both outs go to file1
#ls -al >& file1.txt
#ls +al >& file1.txt

# string processing
# concatenation
read str1
read str2
echo $str1$str2

# case change
str3="linuxclub"
echo ${str3^} # Linuxclub
echo ${str3^^} # LINUCLUB

# capitalize of first letter eq smth
echo ${str3^l} # Linuxclub

echo ${str3^^u} # linUxclUb

str4="LiNuXcLuB"
echo ${str4,} # liNuXcLuB
echo ${str4,,} # linuxclub

# list of all variables
# declare

# create a new string variable
declare strvar=10
# create readonly var and show its attrs
declare -r -p testvar=5
# create int var
declare -i intvar=$strvar
echo $strvar $intvar

strvar=$strvar+5
intvar=$((intvar+5))
echo $strvar $intvar

# export - in terminal so that scripts can see this variable
# or num=12 ./script.sh

# murray
array=(one two "three four" [4]=five)
# display the whole array
echo ${array[*]}
echo ${array[@]} # - 'three four' are two separate elements
echo "${array[@]}" # - 'three four' is one element
echo "${array[*]}" # - returns array as string

echo ${array[4]}

# display length and all indices
echo ${#array[*]}
echo ${!array[*]}

# delete element
unset array[2]
echo ${array[*]}

# functions
function myfunc()(
    echo $1 -- $# -- $@
)
myfunc 123 qwerty 12

# function with (...) doesn't chnage globals;
# with {...} does

# init local var
function localFunc()(
    local var=$1
    echo $var
)
localFunc "local variable"

# return value
var=$(localFunc 12 4)
echo $var

<<grep
-i - case insensitive
-v - invert search (that doesn't contain)
-c - number of matches
grep
