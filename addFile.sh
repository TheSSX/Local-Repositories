#!/bin/bash

#Sam Glendenning
#Matric: 160004927
#Will Lockett
#Matric: 160006641

localDir="$1"
cd "$localDir"

printf "\nEnter a name for your new file:\n"
read filename

while [ -z "$filename" ]
do
{
	printf "Please give your new file a name.\n"
	read filename
}
done
	
if [ -f "$filename" ]
then
{
	printf "A file by this name already exists.\n"
	sleep 3s
	exit 1
}
else
{
	touch "$filename" && printf "%s added %s to the repository at %s.\n" "$USER" "$filename" "$(date)" >> logfile.txt

	printf "Would you like to edit this new file? [Y/N]"
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
		clear
		vim "$filename" 
		printf "%s edited %s at %s.\n" "$USER" "$filename" "$(date)" >> logfile.txt
		exit 0
	}
	fi
}
fi

exit 0