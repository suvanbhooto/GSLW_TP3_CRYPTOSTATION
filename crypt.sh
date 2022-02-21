#!/bin/bash

echo $USER




while true 
do 

	for item in /home/*
	do

		user_name=$item;
		prefix="/home/";
        user_name=${user_name#$prefix}; #Remove prefix
        
		for file in /home/$user_name/crypto_station/toCrypt/*
		do
			
			if  [ -f $file ]
			  then
			  	
				sudo python3 /bin/py_file/crypt.py $file $user_name
				
				rm -r $file
				sleep 2

			else 
			echo "no file found looping"	

			fi
		done

		sleep 1


		for crypted_file in /home/$user_name/crypto_station/Crypted/*
		do
			if  [ -f $crypted_file ]
			  then
			  	
				
				
				sudo chmod 777 $crypted_file
	

			fi
		done



	done	

done

