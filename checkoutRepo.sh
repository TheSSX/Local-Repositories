#!/bin/bash

#Sam Glendenning
#Matric: 160004927
#Will Lockett
#Matric: 160006641

homeDir="$1"
      
cd
cd Repositories
printf "Enter the name of the repository to check out:\n"
read name

while [ -z "$name" ]
do {
	printf "You need to enter a name.\n"
	read name
}
done

if [ -e "$name" ] 
then {
	cd "$name"
	printf "%s checked out the online repository at %s.\n" "$USER" "$(date)" >> logfile.txt
	
	cd "$homeDir"
	if [ -e "$name" ]
	then
	{
		rm -rf "$name"
	}
	fi
	
	cd
	cd Repositories
	cp -r "$name" "$homeDir" && printf "Checked out %s to Local Repositories.\n" "$name"
	sleep 3s
	exit 0
}
else {
	printf "ERROR: no repository of that name found!"
}
fi

exit 1