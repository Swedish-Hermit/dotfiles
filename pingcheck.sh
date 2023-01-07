#!/bin/bash
# if ping = offline exit 1
ping -q -c1 cloudflare.com &>/dev/null && echo online && exit 0 || echo offline && exit 1
