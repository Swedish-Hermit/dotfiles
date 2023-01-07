#!/bin/bash
[[ ! -d "$1" ]] && echo "$1" does not exist! 
# run ping check for network connectivity
sh ~/dotfiles/pingcheck.sh
sleep 1;
cd $1
# rsync the local repo to offsite
rclone sync -P $1 $2 > /mnt/local/cdnbackup.log
exit 0
