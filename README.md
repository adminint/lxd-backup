# lxd-backup

Simple scripts for installation Microsoft Ondrive and backup lxd containers on ubuntu server.
Tested by LXD V. 3 and 4

For installation
1. cd /usr/local/src
2. git clone https://github.com/adminint/lxd-backup.git
2. cd ./lxd-backup
3. cp send_mail.sh snapshot_lxc_publish.sh snapshot_lxc_publish_one.sh download_from_onedrive.sh restore_lxc_from_backup.sh /usr/local/bin/
4. chmod a+x /usr/local/bin/snapshot_lxc_publish.sh; chmod a+x /usr/local/bin/send_mail.sh; chmod a+x /usr/local/bin/snapshot_lxc_publish_one.sh; chmod a+x /usr/local/bin/download_from_onedrive.sh; chmod a+x /usr/local/bin/restore_lxc_from_backup.sh
5. Set username and password for your email account in file /usr/local/bin/send_mail.sh
6. Download shared link from onedrive - wget -cO - "https://SHARED_LINK&download=1" > lxd_backup_file.tar.gz OR download_from_onedrive.sh SHARED_LINK lxd_backup_file-restore

LXD. Restoring from backup (/root/lxd_backup_file.tar.gz - backup file; test - restored container)
1. /usr/local/bin/restore_lxc_from_backup.sh /root/lxd_backup_file.tar.gz test


