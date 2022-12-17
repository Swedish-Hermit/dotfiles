#!/bin/bash
# run ping check for network connectivity
sh ~/dotfilespingcheck.sh
sleep 1;
cd /mnt/local/cdn
# rsync the local repo to offsite
rclone sync --exclude=/msdn/ --exclude=/sidezeoarchive/ --exclude=/Cursed_recordings_with_the_bois/ -P . $1 > /mnt/local/cdnbackup.log
exit 0
