#!/bin/bash

echo Starting HEL1
cd /mnt && rclone copy -P files /mnt/HEL1/files --ignore-existing --exclude=/datahoarding/ --exclude=/.recycle/ > ~/HEL1files.log & rclone copy -P users /mnt/HEL1/users --ignore-existing --exclude=/.recycle/ > ~/HEL1users.log

echo Starting FSN1
cd /mnt && rclone copy -P /mnt/HEL1/files /mnt/FSN1/files --ignore-existing --exclude=/datahoarding/ --exclude=/.recycle/ > ~/FSN1files.log & rclone copy -P /mnt/HEL1/users /mnt/FSN1/users --ignore-existing --exclude=/.recycle/ > ~/FSN1users.log
