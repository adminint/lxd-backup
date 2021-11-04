# lxd-backup

Simple scripts for installation Microsoft Ondrive and backup lxd containers ver. >= 4 on ubuntu server.

For installation
1. cd /usr/local/src
2. git clone https://github.com/adminint/lxd-backup.git
2. cd ./lxd-backup
3. cp send_mail.sh snapshot_lxc_publish.sh /usr/local/bin/
4. chmod a+x /usr/local/bin/snapshot_lxc_publish.sh; chmod a+x /usr/local/bin/send_mail.sh; chmod a+x /usr/local/bin/snapshot_lxc_publish_one.sh
5. Set username and password for your email account in file /usr/local/bin/send_mail.sh
