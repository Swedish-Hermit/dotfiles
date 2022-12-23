#!/bin/bash
sh ~/dotfiles/pingcheck.sh
set -o errexit
if pgrep -x rclone >/dev/null
then
   echo "nope"
   exit 0
fi
   echo "Starting backups"
   cd $1 && rclone sync -vP files rmtbackupdata: --exclude=/datahoarding/cdnbackup --exclude=/.recycle/ > /mnt/dockerdata/Data.log;
   cd $1 && rclone sync -vP users/Robin rmtbackuprobin: --exclude=/.recycle/ > /mnt/dockerdata/Robin.log;
   cd $1 && rclone sync -vP users/Jeffrey rmtbackupjeffrey: --exclude=/.recycle/ > /mnt/dockerdata/jeffrey.log;

