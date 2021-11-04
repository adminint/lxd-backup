#!/bin/bash

INSTALL_DIR="/usr/local/bin/lxd-backup"
if [ ! -d $INSTALL_DIR ] 
then
    mkdir $INSTALL_DIR -p
else
    rm -rf $INSTALL_DIR
fi 

cp -f send_mail.sh snapshot_lxc_publish_all.sh snapshot_lxc_publish_one.sh download_from_onedrive.sh restore_lxc_from_backup.sh /usr/local/bin/lxd-backup
chmod a+x /usr/local/bin/lxd-backup/snapshot_lxc_publish_all.sh
chmod a+x /usr/local/bin/lxd-backup/send_mail.sh
chmod a+x /usr/local/bin/lxd-backup/snapshot_lxc_publish_one.sh
chmod a+x /usr/local/bin/lxd-backup/download_from_onedrive.sh
chmod a+x /usr/local/bin/lxd-backup/restore_lxc_from_backup.sh
