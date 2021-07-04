#! /bin/bash 

for i in $(cat $1); 
do 
	discover.sh $i $2 $3 $4 
done
