#!/bin/bash

INSTALL_DIR="/usr/local/bin/lxd-backup"
if [ ! -d $INSTALL_DIR ] 
then
    mkdir $INSTALL_DIR -p
fi 


cp -f send_mail.sh snapshot_lxc_publish_all.sh snapshot_lxc_publish_one.sh download_from_onedrive.sh restore_lxc_from_backup.sh $INSTALL_DIR
chmod a+x $INSTALL_DIR/snapshot_lxc_publish_all.sh
chmod a+x $INSTALL_DIR/send_mail.sh
chmod a+x $INSTALL_DIR/snapshot_lxc_publish_one.sh
chmod a+x $INSTALL_DIR/download_from_onedrive.sh
chmod a+x $INSTALL_DIR/restore_lxc_from_backup.sh
