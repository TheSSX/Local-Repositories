#!/bin/bash

#Sam Glendenning
#Matric: 160004927
#Will Lockett
#Matric: 160006641

printf "Enter a name for your repository:\n"
read name
		
while [ -z "$name" ]
do
{
	printf "You need to enter a name.\n"
}
done

cd

if [ ! -d Repositories ]
then
{
        mkdir Repositories
}
fi

cd Repositories

if [ -d "$name" ]
then
{
        printf "A repository called %s already exists.\n" "$name"
        sleep 3s
        exit 1
}
else
{
        mkdir "$name" && printf "A repository called %s has been created.\n" "$name"
        
        if [ ! -d "$name" ]
        then
        {
                printf "Error. Not enough disk space to create this repository.\n"
                exit 1
        }
        fi
        
        cd "$name"
        touch logfile.txt
        
        printf "%s LOGFILE\n\n" "$name" > logfile.txt
        printf "%s created this repository at %s.\n" "$USER" "$(date)" >> logfile.txt
}
fi

sleep 3s

exit 0