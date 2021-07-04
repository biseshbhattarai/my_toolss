#! /bin/bash
if [ $# -eq 0 ]
then
	echo "Usage 
	      discover <URL> <WORDLISTS PATH> 
	      IF SPECIFIC OUTPUT FOLDER 
              discover <URL> <WORDLISTS PATH> <FOLDER_NAME>	      
	"


elif [ -z "$3" ] 
then 	
	s=$(echo $1 | sed -e 's|^[^/]*//||' -e 's|/.*$||')
	ffuf -u $1/FUZZ -w ~/wordlists/$2 -o ~/hacking/ffuf_data_boi/$s$4.json
else 
	if [ -d ~/hacking/ffuf_data_boi/$3 ]
	then
		
		s=$(echo $1 | sed -e 's|^[^/]*//||' -e 's|/.*$||')
		ffuf -u $1/FUZZ -w ~/wordlists/$2 -o ~/hacking/ffuf_data_boi/$3/$s$4.json
	else
		
		mkdir ~/hacking/ffuf_data_boi/$3 
        	s=$(echo $1 | sed -e 's|^[^/]*//||' -e 's|/.*$||')	
	ffuf -u $1/FUZZ -w ~/wordlists/$2 -o ~/hacking/ffuf_data_boi/$3/$s$4.json
	
	fi 
fi


