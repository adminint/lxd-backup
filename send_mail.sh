#!/bin/bash

NAME=`/bin/cat /usr/local/bin/backup.log |/bin/grep CONTAINER |awk {'print $2'} |/bin/sed 's/=/ /g' |awk {'print $2'}`
/usr/bin/swaks --to gebs@infolink.ru --from "smart-intercom@infolink.ru" --header "Subject: ALL-LXD-BACKUP: container - $NAME"  --body $1 \
--server mail.infolink.ru \
--port 25 --timeout 40s --auth LOGIN --auth-user "smart-intercom@infolink.ru" \
--auth-password "*********"
> /usr/local/bin/backup.log
