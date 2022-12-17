#!/bin/bash
###check if network is up
sh ~/dotfiles/pingcheck.sh
if [ "$#" -ne 1 ];
        then echo -e "\nUsage: sh riksdagen.sh path\n";
        exit 1;
fi
###run backups
echo "mounting riksdagen"
rclone mount -vvvP riksdagen: $1 --daemon --allow-other
sleep 1;
cd ~/scrapers/riksdagen/
echo "running scraper"
python3 riksdagen.py --update all -o $1
sleep 1;
echo "unmounting drive"
umount $1
