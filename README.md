# lxd-backup

Simple scripts for installation Microsoft Ondrive and backup lxd containers ver. >= 4 on ubuntu server.

For installation
1. cd /usr/local/src
2. git clone https://github.com/adminint/lxd-backup.git
2. cd ./lxd-backup
3. cp send_mail.sh snapshot_lxc_publish.sh snapshot_lxc_publish_one.sh download_from_onedrive.sh /usr/local/bin/
4. chmod a+x /usr/local/bin/snapshot_lxc_publish.sh; chmod a+x /usr/local/bin/send_mail.sh; chmod a+x /usr/local/bin/snapshot_lxc_publish_one.sh; chmod a+x /usr/local/bin/download_from_onedrive.sh
5. Set username and password for your email account in file /usr/local/bin/send_mail.sh
6. Download shared link from onedrive - wget -cO - "https://SHARED_LINK&download=1" > lxd_backup_file.tar.gz OR download_from_onedrive.sh SHARED_LINK lxd_backup_file-restore

LXD. Restoring from backup
1. lxc image import /root/lxd_backup_file.tar.gz --alias lxd_backup_file-restore
2. lxc launch lxd_backup_file-restore test
3. lxc image delete lxd_backup_file-restore

