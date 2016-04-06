#!/bin/bash
INPUT=data.csv
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read drive_id email
do
	echo "Email: $email"
	echo "Drive: $drive_id"
    mkdir -p ./mbox/$email
    /opt/pgam/gam.py user michael.osiecki@kohls.com get drivefile id $drive_id targetfolder ./mbox/$email
done < $INPUT
IFS=$OLDIFS
