#!/bin/bash

#Sam Glendenning
#Matric: 160004927
#Will Lockett
#Matric: 160006641

localDir="$1"

cd "$localDir"

if [ $(find -name "*.c") ]
then
{
	printf "Enter the name(s) of the C source file(s) to compile, each followed by a space:\n"
	read cfiles
	
	while [ -z "$cfiles" ]
	do
	{
		printf "Please enter the names of the source files.\n"
		read cfiles
	}
	done
	
	if [ $(find -name "*.h") ]
	then
	{
		printf "Enter the name(s) of the header file(s) to compile, each followed by a space. Leave blank if no header files.\n"
		read hfiles
		
		printf "Enter a name for your program.\n"
		read name
	
		while [ -z "$name" ]
		do
		{
			printf "Please enter a name.\n"
			read name
		}
		done
		
		if [ -z "$hfiles" ]
		then
		{
			gcc -o "$name" -Wall -pedantic -Wextra "$cfiles"
		}
		else
		{
			gcc -o "$name" -Wall -pedantic -Wextra "$cfiles" "$hfiles"	
		}
		fi
	}
	else
	{
		printf "Enter a name for your program.\n"
		read name
	
		while [ -z "$name" ]
		do
		{
			printf "Please enter a name.\n"
			read name
		}
		done
	}
	fi
}
else
{
	printf "\nThere are no C source files to compile.\n"
	sleep 3s
	exit 1
}
fi

printf "Compiling...\n"
sleep 5s
exit 0