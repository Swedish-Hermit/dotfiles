#!/bin/bash
# run pingcheck script"
sh ~/dotfiles/pingcheck.sh
# make sure everything is working correctly
set -o errexit
set -o nounset
# ssh systemsboy@rhost.systemsboy.edu 'ls -l'
if [ "$#" -ne 1 ];
	then echo -e "\nUsage: sh patch_systems.sh hostname\n";
	exit 1;
fi
ssh -t $1 'sudo apt-get update && sudo apt-get upgrade && sudo apt autoremove'

