#!/bin/bash
sh ~/dotfiles/pingcheck.sh
set -o errexit
set -o nounset
PATH=/mnt
if pgrep -x "rclone" >/dev/null
then
   echo "rclone is running exiting..."
else
echo "Starting HEL1"
cd $PATH && rclone sync -P files /mnt/HEL1/files --exclude=/datahoarding/ --exclude=/.recycle/ > ~/HEL1files.log;
cd $PATH && rclone sync -P users /mnt/HEL1/users --exclude=/.recycle/ > ~/HEL1users.log;

echo "Starting FSN1"
cd $PATH && rclone sync -P /mnt/HEL1/files /mnt/FSN1/files --transfers 30 --exclude=/datahoarding/ --exclude=/.recycle/ > ~/FSN1files.log;
cd $PATH && rclone sync -P /mnt/HEL1/users /mnt/FSN1/users --transfers 30 --exclude=/.recycle/ > ~/FSN1users.log;
exit 0
fi
