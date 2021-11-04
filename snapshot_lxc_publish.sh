#!/usr/bin/env bash
(
TIMEFORMAT="LIDE_TIME: %lR"
time {

set -ex



NOW=$(date +'%m-%d-%Y-%H')
BACKUP_DIR="/root/OneDrive/Balnet/" 
 
if [ ! -d $BACKUP_DIR"/"$NOW ] 
then
    mkdir $BACKUP_DIR"/"$NOW -p
fi 

## Dump LXD server config ##
lxd init --dump > $BACKUP_DIR"/"$NOW"/lxd.config.${NOW}"
 
## Dump all instances list ##
lxc list > $BACKUP_DIR"/"$NOW"/lxd.instances.list.${NOW}"

HOSTS=($(lxc list -c n --format csv))

	for HOST in "${HOSTS[@]}"
	do
	    CONTAINER=${HOST}
		BACKUP_NAME=${HOST}-$(date +"%Y-%m-%d-%H")
		lxc snapshot ${HOST} auto-backup
		lxc publish ${HOST}/auto-backup --alias ${BACKUP_NAME}
		lxc image export ${BACKUP_NAME} "$BACKUP_DIR"/"$NOW"/${BACKUP_NAME}
		lxc image delete ${BACKUP_NAME}
		lxc delete ${HOST}/auto-backup
	done	
if [ -d $BACKUP_DIR"/"$NOW ] 
then
    onedrive --synchronize --upload-only --no-remote-delete
	
	rm -rf $BACKUP_DIR*
fi
}	
) 2>&1 | tee  -a /usr/local/bin/backup.log; /usr/local/bin/send_mail.sh /usr/local/bin/backup.log;