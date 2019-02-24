#!/bin/bash

#Sam Glendenning
#Matric: 160004927
#Will Lockett
#Matric: 160006641

localDir="$1"
repoDir="$2"
cd "$localDir"

	printf "Enter the name of the file to commit to the online repository\n"
	read filename

	while [ -z "$filename" ] 
	do
	{
		printf "Enter the name of the file to commit\n"
		read filename
	}
	done

	if [ -f "$filename" ]
	then
	{
		cd "$repoDir"
		
		if [ -f "$filename" ]
		then
		{
			printf "%s already exists in the repository. Overwrite? [Y/N]" "$filename"
			read overwrite

            while [ "$overwrite" != y ] && [ "$overwrite" != n ] && [ "$overwrite" != Y ] && [ "$overwrite" != N ]
            do
            {
              	if [ -z "$overwrite" ]
                then 
                {
                  	printf "You need to enter a value\n"
                }
                else
                {
                 	printf "Error. Please enter either Y or N.\n"
                }
                fi

                read overwrite
           	}
            done

            if [ "$overwrite" = y ] || [ "$overwrite" == Y ]
            then 
            {
				rm -rf "$filename"
            }
			else
			{
				exit 1
			}
            fi
		}
		fi
		
		cd "$localDir"
		cp "$filename" "$repoDir"
		printf "%s committed %s to the online repository at %s.\n" "$USER" "$filename" "$(date)" >> logfile.txt
		printf "Commit successful.\n"
		sleep 3s
		
        exit 0
	}
	else
	{
		printf "File %s does not exist" "$filename"
		sleep 3s
	}
	fi
	
	exit 1