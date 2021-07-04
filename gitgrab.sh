while true 
do 
	if [ -s ~/hacking/git_company_name ] 
	then 
		for i in $(cat ~/hacking/git_company_name) 
		do
		python ~/tools/gitGraber/gitGraber.py -k ~/tools/gitGraber/wordlists/keywords.txt -q $i -d  
	      done
	fi 
done 
sleep 1000 
