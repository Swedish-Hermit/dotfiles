#!/bin/bash
echo Starting local backups
cd /mnt/files && rclone copy -P . /mnt/data/files/
cd /mnt/users && rclone copy -P . /mnt/data/users
echo Starting offsite
cd /mnt && rclone copy -P files /mnt/offsite/files && rclone copy -P users /mnt/offsite/users
