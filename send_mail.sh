#!/bin/bash

NAME=`/bin/cat /usr/local/bin/backup.log |/bin/grep CONTAINER |awk {'print $2'} |/bin/sed 's/=/ /g' |awk {'print $2'}`
/usr/bin/swaks --to YOU_EMAIL@domain.com --from "backup@domain.com" --header "Subject: ALL-LXD-BACKUP: container - $NAME"  --body $1 \
--server mail.domain.com \
--port 25 --timeout 40s --auth LOGIN --auth-user "backup@domain.com" \
--auth-password "MAIL_PASSWORD"
> /usr/local/bin/backup.log
