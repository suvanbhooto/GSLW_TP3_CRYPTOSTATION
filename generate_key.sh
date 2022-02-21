#!/bin/bash




if  [ -d .enkey ]
	then  
	  python3 python_file/generate.py

else 
	mkdir .enkey
	python3 python_file/generate.py

fi



