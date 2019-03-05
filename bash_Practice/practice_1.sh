#!/bin/bash

#------------- Comment -----------
echo "-------------- Comment --------------"
: <<'COMMENT'
block comment
echo "Hello"
COMMENT
# single line comment

#-------- Bash Variables ---------
echo "----------- Bash Variables ----------"
my_var='I am Yue'
echo $my_var
echo 'What is your name?'
read x y
# read some input given by the user
echo 'Hello'
echo $x
echo $y

# ----- Conditional Expression -------------
echo "------ Conditional Expression ------"
# --- logical expressions on numerical values
a=1
b=2
if [ $a -eq $b ]; then
	echo "$a = $b"
elif [ $a -gt $b ]; then
	echo "$a > $b"
else
	echo "$a < $b"
fi
# --- logical expressions on string
str1='abc'
str2='cba'
if [ $str1 = $str2 ]; then
	echo "$str1 equals $str2"
else
	echo "$str1 and $str2 are not equal"S
fi
# [cond ] is an alias for the command test cond

#---------- Switch Expression ----------
echo "------- Switch Expression --------"
res="apple"
case $res in
"apple")
	echo "This is an apple";;
"banana")
	echo "This is a banana";;
*)
	echo "This is a fruit (default case)"
esac

#------------ While loop ---------------
echo "--------- While Loop -------------"
x=1
while [ $x -le 3 ]; do
	#echo "please input something"
	#read y
	#echo "your in put is: $y"
	echo $x
	let x++
done

#------------ For Loop ---------------
echo "--------- For Loop -------------"
for var in 1 2 3 4; do
	echo $var
done

#------- Parameters of Command --------
echo "---- Parameters of Command ------"
: <<'COMMENT'
for the command ./script.sh arg1 arg2 arg3 ...
$0 - script.sh
$1 - arg1
$2 - arg2
$3 - arg3
...
$# - the number of parameters
$@ - list of the parameters
shift: shift the list of parameters
COMMENT

for i in $@; do
	echo $i
done

#---------- Nested Commands -----------
echo "-------- Nested Commands --------"
date
# to get the output(text) of a command cmd, use $(cmd)
echo "today is $(date)"
echo $?

mysql -h localhost -u root -p950918 -D "world" -e "show tables"
