#!/bin/bash
sh ~/dotfiles/pingcheck.sh
set -o errexit
set -o nounset
system=$1
###ssh systemsboy@rhost.systemsboy.edu 'ls -l'
if [ "$#" -ne 1 ];
	then echo -e "\nUsage: sh patch_systems.sh hostname\n";
	exit 1;
fi
ssh -t $system 'sudo apt-get update && sudo apt-get upgrade && sudo apt autoremove'

