
while true
do
rm wildcards.txt 
cd ~/hacking/subdomain_takeover/bounty-targets-data/; 
git pull; 
cd ~/hacking/subdomain_takeover; 
cp ~/hacking/subdomain_takeover/bounty-targets-data/data/wildcards.txt ./;
cat wildcards.txt | sed 's/^*.//g' | grep -v '*' | anew wildcards_without_stars.txt; 
while read host; 
	   do  
	      subfinder -d $host | anew all_subdomains.lst; 
	      done < ./wildcards_without_stars.txt;
	     #~/go/pkg/mod/github.com/!ice3man543/!sub!over@v0.0.0-20180830003845-3d258e254ab5/SubOver -l ./all_subdomains.lst -timeout 5 | notify ;
	       
      done; 
      sleep 15 ; 
