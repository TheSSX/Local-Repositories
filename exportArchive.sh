#!/bin/bash

#Sam Glendenning
#Matric: 160004927
#Will Lockett
#Matric: 160006641

localDir="$1"
cd "$localDir"
	dirName="${PWD##*/}"
	cd ..

	printf "Enter a name for your archive:\n"
	read name
	
	while [ -z "$name" ]
	do
	{
		printf "You need to enter a name.\n"
		read name
	}
	done

	printf "Enter T to export as a TAR archive or Z to export as a ZIP archive.\n"
	read tarzip

		while [ "$tarzip" != t ] && [ "$tarzip" != T ] && [ "$tarzip" != z ] && [ "$tarzip" != Z ]
		do
		{
			if [ -z "$tarzip" ]
			then  
			{
				printf "You need to enter a value\n"
			}
			else
			{
					printf "Error. Please enter either T or Z.\n"
			}
			fi

			read tarzip
		}
		done

		if [ "$tarzip" = T ] || [ "$tarzip" = t ]
		then 
		{		
			tar -cvf "$name".tar "$dirName"
			mv "$name".tar "$localDir"
		}
		else
		{
			zip -r "$name".zip "$dirName"
			mv "$name".zip "$localDir"
		}
		fi	
		
		printf "Done.\n"
		sleep 3s
		exit 0