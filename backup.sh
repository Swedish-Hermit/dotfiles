#!/bin/bash
sh ~/dotfiles/pingcheck.sh
set -o errexit
set -o nounset
echo "Starting HEL1"
cd $1 && rclone copy -P files /mnt/HEL1/files --ignore-existing --transfers 30 --exclude=/datahoarding/ --exclude=/.recycle/ > /mnt/dockerdata/HEL1files.log;
cd $1 && rclone copy -P users /mnt/HEL1/users --ignore-existing --transfers 30 --exclude=/.recycle/ > /mnt/docker/dataHEL1users.log;

echo "Starting FSN1"
cd $1 && rclone copy -P /mnt/HEL1/files /mnt/FSN1/files --ignore-existing --transfers 30 --exclude=/datahoarding/ --exclude=/.recycle/ > /mnt/dockerdata/FSN1files.log; 
cd $1 && rclone copy -P /mnt/HEL1/users /mnt/FSN1/users --ignore-existing --transfers 30 --exclude=/.recycle/ > /mnt/dockerdataFSN1users.log;
exit 0
