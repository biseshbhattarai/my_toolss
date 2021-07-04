#! /bin/bash 


for i in $(cat $1)
	do
	       	
	   waybackurls $i | grep -iE "\.js$" | uniq | sort | tee -a output
	       
	done


