#!/bin/bash


while true
do	


	for item in /home/*
	do

		user_name=$item;
		prefix="/home/";
        user_name=${user_name#$prefix}; #Remove prefix

		for file in /home/$user_name/crypto_station/toDecrypt/*
		do
			if  [ -f $file ]
			  then
				sudo python3 /bin/py_file/decrypt.py $file $user_name
				sudo rm -r $file
				sleep 2


			else
			echo "no file found looping"	

			fi

		done

		sleep 1



		for decrypted_file in /home/$user_name/crypto_station/Decrypted/*
		do
			if  [ -f $decrypted_file ]
			  then
			  	
				
				
				sudo chmod 777 $decrypted_file

				

			fi
	
		done 

	done	

done
