#! /bin/bash 
echo "looking in ~hacking/giturls"
while true 
do 
	if [ -s ~/hacking/giturls ]
	then	
		for i in $(cat ~/hacking/giturls)
		do
			#v1 = `echo i | cut -d / -f1` 
			#v2 = `echo i | cut -d / -f2`
		        if [ -d ~/hacking/gitmakeichaki/$(echo $i | cut -d / -f1) ]
			then
				
				trufflehog --regex --entropy=False https://github.com/$i | anew ~/hacking/gitmakeichaki/$(echo $i | cut -d / -f1)/ds.txt
			
		
			else
				
				mkdir ~/hacking/gitmakeichaki/$(echo $i | cut -d / -f1)
				trufflehog --regex --entropy=False https://github.com/$i | anew ~/hacking/gitmakeichaki/$(echo $i | cut -d / -f1)/ds.txt  
			fi
		done
	fi
done 
sleep 20 

		
