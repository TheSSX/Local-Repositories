#!/bin/bash

#Sam Glendenning
#Matric: 160004927
#Will Lockett
#Matric: 160006641

localDir="$1"
cd "$localDir"

printf "Enter the name of the file to edit.\n"
	read filename

	while [ -z "$filename" ]
	do
	{
		printf "Enter the name of the file\n"
		read filename
	}
	done

	if [ -f "$filename" ]
	then
	{
		vim "$filename"
		printf "%s edited %s at %s.\n" "$USER" "$filename" "$(date)" >> logfile.txt
	}
	else
	{
		printf "%s is either not a file or doesn't exist.\n" "$filename"
		exit 1
	}
	fi

	exit 0