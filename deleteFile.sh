#!/bin/bash

#Sam Glendenning
#Matric: 160004927
#Will Lockett
#Matric: 160006641

localDir="$1"
cd "$localDir"

printf "Enter the name of the file to delete\n"
	read filetodelete

	while [ -z "$filetodelete" ]
	do
	{
		printf "Enter the name of the file.\n"
		read filetodelete
	}
	done
	
	if [ "$filetodelete" = "logfile.txt" ]
	then
	{
		rm -f logfile.txt
		exit 0
	}
	fi

	if [ -f "$filetodelete" ]
	then
	{
		printf "Are you sure you want to delete %s? [Y/N]" "$filetodelete"
		read yesno

		while [ "$yesno" != y ] && [ "$yesno" != n ] && [ "$yesno" != Y ] && [ "$yesno" != N ]
		do
		{
			if [ -z "$yesno" ]
			then  
			{
				printf "You need to enter a value\n"
			}
			else
			{
					printf "Error. Please enter either Y or N.\n"
			}
			fi

			read yesno
		}
		done

		if [ "$yesno" = Y ] || [ "$yesno" = y ]
		then 
		{
			rm "$filetodelete"
			printf "%s deleted %s at %s.\n" "$USER" "$filetodelete" "$(date)" >> logfile.txt
			exit 0
		}
		fi	
	}
	else
	{
		printf "File %s does not exist" "$filetodelete"
		sleep 3s
		exit 1
	}
	fi

	exit 0