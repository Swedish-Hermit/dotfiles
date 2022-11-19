#!/bin/bash
###run ping check for network connectivity
sh ~/dotfilespingcheck.sh
sleep 1;
cd /mnt/local/cdn
###rsync the local repo to offsite
rsync -ahvzuP . --no-perms --delete --exclude msdn/ --exclude Cursed_recordings_with_the_bois/ --exclude sidezeoarchive/ $1 > /mnt/local/cdnbackup.log
echo "exiting script have a nice day"
exit 0
