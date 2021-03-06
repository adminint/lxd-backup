#!/usr/bin/env bash
(
TIMEFORMAT="LIDE_TIME: %lR"
time {

set -ex
CONTAINER=$1


#NOW=$(date +'%m-%d-%Y-%H')
NOW=$(date +'%m-%d-%Y')

BACKUP_DIR="/root/OneDrive/$HOSTNAME/" 
 
if [ ! -d $BACKUP_DIR"/"$NOW ] 
then
    mkdir $BACKUP_DIR"/"$NOW -p
fi 

BACKUP_NAME=${CONTAINER}-$(date +"%Y-%m-%d-%H")
lxc snapshot ${CONTAINER} auto-backup
lxc publish ${CONTAINER}/auto-backup --alias ${BACKUP_NAME}
lxc image export ${BACKUP_NAME} "$BACKUP_DIR"/"$NOW"/${BACKUP_NAME}
lxc image delete ${BACKUP_NAME}
lxc delete ${CONTAINER}/auto-backup
	
if [ -d $BACKUP_DIR"/"$NOW ] 
then
    onedrive --synchronize --upload-only --no-remote-delete
	
	rm -rf $BACKUP_DIR*
fi
}	
) 2>&1 | tee  -a /usr/local/bin/backup.log; /usr/local/bin/send_mail.sh /usr/local/bin/backup.log;
