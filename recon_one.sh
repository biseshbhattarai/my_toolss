#! /bin/bash 

#Author reverser 

while true
do	
if [ -s ~/hacking/scope ]
then
for i in $(cat ~/hacking/scope);
	do mkdir ~/hacking/recon/$i
	echo $i >> process_directories
	interlace -tL ~/hacking/scope -threads 10 -c "assetfinder -subs-only _target_ | anew ~/hacking/recon/$i/domains" 
	interlace -tL ~/hacking/scope -threads 10 -c "subfinder -d _target_ | anew ~/hacking/recon/$i/domains" 
	cat ~/hacking/recon/$i/domains | httprobe prefer-https | anew ~/hacking/recon/$i/hosts
	interlace -tL ~/hacking/recon/$i/hosts -threads 5 -c "waybacks_and_gau.sh _target_  ~/hacking/recon/$i/waybackurls_and_gau"
	interlace -tL ~/hacking/recon/$i/hosts -threads 5 -c "nuclei -u _target_ -t cves/ -severity low,medium,high,critical | anew ~/hacking/recon/$i/nuclei_output"	
	interlace -tL ~/hacking/recon/$i/hosts -threads 5 -c "nuclei -u _target_ -t vulnerabilites/ -severity low,medium,high,critical | anew ~/hacking/recon/$i/nuclei_output"
	rm ~/hacking/scope
	touch ~/hacking/scope
	cat ~/hacking/notice | notify 
	done;
	sleep 15 
else 
	sleep 15
fi	
done;
