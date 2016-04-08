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
    /mnt/mbox/pgam/gam.py user michael.osiecki@kohls.com get drivefile id $drive_id targetfolder ./mbox/$email
    python ./import-mailbox-to-gmail.py --dir mbox --json private_key.json
    rm -rf ./mbox/$email
done < $INPUT
IFS=$OLDIFS
