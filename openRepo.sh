#!/bin/bash

#Sam Glendenning
#Matric: 160004927
#Will Lockett
#Matric: 160006641

displayFiles()
{
	dir="$1"
	cd "$dir"
	dirName="${PWD##*/}"
	
	if [ "$(ls -A "$dir")" ]
	then
	{
		printf "Here are the files inside %s\n\n" "$dirName"
		ls -l
		printf "_______________________________________________________\n"
		return 0
	}
	else
	{
		printf "%s is empty.\n" "$dirName"
		return 1
	}
	fi	
}

chooseOption()
{
	localDir="$1"
	repoDir="$2"
	homeDir="$3"
	scriptDir="$4"

	while [ "$input" != 10 ]
	do
	{
		cd "$localDir"
		printf "\n1. Add a file\n"
		printf "2. Edit a file\n"
		printf "3. Delete a file\n"
		printf "4. View logfile\n\n"
		
		printf "Further Options\n"	
		printf "5. Commit a single file\n"
		printf "6. Commit entire repository\n"
		printf "7. Checkout latest version\n"
		printf "8. Export repository as archive\n"
		printf "9. Compile files into C project\n\n"
		printf "10. Exit repository\n"

		read input

		while [ "$input" != 1 ] && [ "$input" != 2 ] && [ "$input" != 3 ] && [ "$input" != 4 ] && [ "$input" != 5 ] && [ "$input" != 6 ] && [ "$input" != 7 ] && [ "$input" != 8 ] && [ "$input" != 9 ] && [ "$input" != 10 ]
		do
		{
			if [ -z "$input" ]
			then
			{
				printf "You need to enter a value\n"	
			}
			else
			{
				printf "Error. Please enter a number 1 to 8.\n"
			}
			fi

			read input
		}
		done

		clear

		if [ "$input" -eq 1 ] 
		then
		{	
			cd "$scriptDir"
			sh addFile.sh "$localDir"
		}
		elif [ "$input" -eq 2 ]
		then
		{
			displayFiles "$localDir"
			return=$?

       		if [ "$return" = 0 ]
			then
			{
				cd "$scriptDir"
				sh editFile.sh "$localDir"
			}
			fi
		}
		elif [ "$input" -eq 3 ]
		then
		{
			displayFiles "$localDir"
			return=$?

       		if [ "$return" = 0 ]
			then
			{
				cd "$scriptDir"
				sh deleteFile.sh "$localDir"
			}
			fi
		}
		elif [ "$input" -eq 4 ]
		then
		{
			displayFiles "$localDir"
			return=$?

       		if [ "$return" = 0 ]
			then
			{
				cd "$localDir"
				less logfile.txt
			}
			fi
		}
		elif [ "$input" -eq 5 ]
		then
		{
			displayFiles "$localDir"
			return=$?

       		if [ "$return" = 0 ]
			then
			{
				cd "$scriptDir"
				sh commitFile.sh "$localDir" "$repoDir"
			}
			fi
		}
		elif [ "$input" -eq 6 ]
		then
		{
			cd "$scriptDir"
			sh commitRepo.sh "$localDir" "$repoDir"
		}
		elif [ "$input" -eq 7 ]
		then
		{
			printf "Checking out overwrites the local repository. Continue? [Y/N]"
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
				dirName="${PWD##*/}"
				cd ..
				rm -rf "$dirName"
				cd
				cd Repositories
				cp -r "$dirName" "$homeDir"
			}
			fi			
		}
		elif [ "$input" -eq 8 ]
		then
		{
			displayFiles "$localDir"
			return=$?

       		if [ "$return" = 0 ]
			then
			{
				cd "$scriptDir"
				sh exportArchive.sh "$localDir"
			}
			fi
		}
		elif [ "$input" -eq 9 ]
		then
		{
			displayFiles "$localDir"
			return=$?

       		if [ "$return" = 0 ]
			then
			{
				cd "$scriptDir"
				sh compile.sh "$localDir"
			}
			fi
		}
		fi
		
		if [ "$input" != 10 ]
		then
		{
			clear
			displayFiles "$localDir" 
		}
		else
		{
			return 0
		}
		fi
	}
	done
}

#Start of script

homeDir="$1"
scriptDir="$2"

printf "Enter the name of the local repository to open:\n"
read name

cd "$homeDir"

if [ -d "$name" ]
then
{
	cd "$name"
	localDir="$(pwd)"
    clear

    if [ "$(ls -A "$localDir")" ]
    then 
    {
		displayFiles "$localDir"
    }
    else
    {
    	clear
        printf "%s is currently empty.\n" "$name"
    }
    fi
				
	cd
	cd Repositories
	cd "$name"
	repoDir="$(pwd)"
						
	chooseOption "$localDir" "$repoDir" "$homeDir" "$scriptDir"
}
else
{
	printf "You do not have a local repository called %s. Have you checked anything out yet?\n" "$name"
	sleep 3s
	exit 1
}
fi

exit 0