#!/bin/bash
sh ~/dotfiles/pingcheck.sh
set -o errexit
P=/mnt
if pgrep -x rclone >/dev/null
then
   echo "nope"
   exit 0
fi
   echo "Starting backups"
   cd $P && rclone sync -vP files rmtbackupdata: --exclude=/datahoarding/cdnbackup --exclude=/.recycle/ > /mnt/dockerdata/Data.log;
   cd $P && rclone sync -vP users/Robin rmtbackuprobin: --exclude=/.recycle/ > /mnt/dockerdata/Robin.log;
   cd $P && rclone sync -vP users/Robin rmtbackupjeffrey: --exclude=/.recycle/ > /mnt/dockerdata/jeffrey.log;

