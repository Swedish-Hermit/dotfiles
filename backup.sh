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
cd $PATH && rclone copy -P files /mnt/HEL1/files --ignore-existing --exclude=/datahoarding/ --exclude=/.recycle/ > ~/HEL1files.log;
cd $PATH && rclone copy -P users /mnt/HEL1/users --ignore-existing --exclude=/.recycle/ > ~/HEL1users.log;

echo "Starting FSN1"
cd $PATH && rclone copy -P /mnt/HEL1/files /mnt/FSN1/files --ignore-existing --transfers 30 --exclude=/datahoarding/ --exclude=/.recycle/ > ~/FSN1files.log;
cd $PATH && rclone copy -P /mnt/HEL1/users /mnt/FSN1/users --ignore-existing --transfers 30 --exclude=/.recycle/ > ~/FSN1users.log;
exit 0
fi
