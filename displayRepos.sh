#!/bin/bash

#Sam Glendenning
#Matric: 160004927
#Will Lockett
#Matric: 160006641

cd
	
if [ ! -d Repositories ]
then
{
	printf "You do not have a repositories folder. Make one now? [Y/N]"
	read input

    while [ "$input" != y ] && [ "$input" != n ] && [ "$input" != Y ] && [ "$input" != N ]
    do
	{
    	if [ -z "$input" ]
        then
        {
        	printf "You need to enter a value\n"
        }
        else
        {
            printf "Error. Please enter either Y or N.\n"
        }
        fi

		read input
    }
	done

    if [ "$input" == y ] || [ "$input" == Y ]
    then
    {
   	 	mkdir Repositories && printf "You now have a repositories folder.\n"

        if [ ! -d Repositories ]
        then
        {
        	printf "You do not have enough disk space to create this folder.\n"
        }
        fi
    }
    fi
}
else
{
	cd Repositories

	if [ -z "$(ls -A ./)" ]
	then
	{
		printf "You do not have any repositories.\n"
		exit 1
	}
	else
	{
		printf "Your online repositories:\n"
		ls -t
	}
	fi
}
fi

exit 0