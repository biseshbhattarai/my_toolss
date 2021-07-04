while true 
do 
	interlace -tL ~/hacking/subdomain_takeover/hosts.txt -threads 7 -c "nuclei -u _target_ -t cves/ -severity low,medium,high,critical -interactsh-url c35e03713hovtddtv7b0cdfqydeyyyyyn.interact.sh | anew ~/hacking/global_nuclei/scan_everytime_data.txt | notify"
done 
sleep 20
