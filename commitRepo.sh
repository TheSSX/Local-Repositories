#!/bin/bash

#Sam Glendenning
#Matric: 160004927
#Will Lockett
#Matric: 160006641

localDir="$1"
repoDir="$2"
	
	printf "Committing the entire local repository overwrites the online one.\n"
	printf "Continue? [Y/N]"
	read commit

    while [ "$commit" != y ] && [ "$commit" != n ] && [ "$commit" != Y ] && [ "$commit" != N ]
    do
    {
    	if [ -z "$commit" ]
        then 
        {
        	printf "You need to enter a value\n"
        }
        else
        {
            printf "Error. Please enter either Y or N.\n"
        }
        fi

        read commit
   	}
    done

    if [ "$commit" = y ] || [ "$commit" == Y ]
    then
    {
		cd "$localDir"
		dirName="${PWD##*/}"
		cd "$repoDir"
		cd ..
		repositoriesFolder="$(pwd)"
		rm -rf "$dirName"
		
		cd "$localDir"
		printf "%s committed the entire repository at %s.\n" "$USER" "$(date)" >> logfile.txt
		cd ..
		cp -r "$dirName" "$repositoriesFolder"
		
		printf "Commit successful.\n"
		sleep 3s
		exit 0
    }
	else
	{
		exit 1
	}
    fi