while true

do 
	#cat ~/hacking/subdomain_takeover/all_subdomains.lst | httprobe --prefer-https -c 50 | anew ~/hacking/subdomain_takeover/hosts.txt 
	nuclei -update-templates 
	interlace -tL ~/hacking/subdomain_takeover/hosts.txt -threads 7 -c "nuclei -u _target_ -t vulnerabilities/ -severity low,medium,high,critical -interactsh-url c35e03713hovtddtv7b0cdfqydeyyyyyn.interact.sh | anew ~/hacking/global_nuclei/scan_everytime_data.txt | notify"
	interlace -tL ~/hacking/subdomain_takeover/hosts.txt -threads 7 -c "nuclei -u _target_ -t misconfiguration/ -severity low,medium,high,critical -interactsh-url c35e03713hovtddtv7b0cdfqydeyyyyyn.interact.sh | anew ~/hacking/global_nuclei/scan_everytime_data.txt | notify"
	
done; 
sleep 15 

