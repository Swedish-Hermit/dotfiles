#!/bin/bash
cert='RMT-PKI-RTCA_Robin!0027s Media Team Root X1_BASE64.crt'
sh ~/dotfiles/pingcheck.sh
set -o errexit
set -o nounset
###error if not ran with sudo
[[ "$(id -u)" == 0 ]] || { echo "Run: sudo !!" ; exit 1 ; }
cp -v $cert /usr/local/share/ca-certificates/ && update-ca-certificates
