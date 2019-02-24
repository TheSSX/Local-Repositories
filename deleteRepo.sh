#!/bin/bash
   
#Sam Glendenning
#Matric: 160004927
#Will Lockett
#Matric: 160006641   
   
	cd
	cd Repositories
	
	printf "Enter the name of the online repository you want to delete.\n"
	read name
	
	if [ -d "$name" ]
    then
    {
		printf "Are you sure you want to delete %s? [Y/N]" "$name"
		read delete

        while [ "$delete" != y ] && [ "$delete" != n ] && [ "$delete" != Y ] && [ "$delete" != N ]
        do
        {
        	if [ -z "$delete" ]
            then  
			{
				printf "You need to enter a value\n"
            }
            else
            {
     	    	printf "Error. Please enter either Y or N.\n"
            }
            fi

            read delete
     	}
        done

        if [ "$delete" = Y ] || [ "$delete" = y ]
        then 
        {
        	rm -rf "$name"
			
			if [ ! -d "$name" ]
			then
			{
				printf "%s has been deleted\n" "$name"
				sleep 3s
				exit 0
			}
			else
			{
				printf "Error deleting %s\n" "$name"
			}
			fi
        }
        fi
	}
	else
	{
		printf "There is no repository called %s\n" "$name"
	}
	fi
}
fi

sleep 3s
exit 1