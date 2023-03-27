#!/bin/bash

echo "enter   1  for SALAT client"
echo "enter   2  for Famyli client"

read varVersion

case $varVersion in
	"1" )
			magazin="salat"
		;;
	"2" )
			magazin="agg"
		;;
	* )
			echo "ERROR Enter 1 or 2"
			sleep 5
			exit;
		;;
esac

# sudo apt -y update
# sleep 2
# sudo apt -y install vlc

echo "
#/bin/bash
killall vlc
sleep 0.5
cvlc \"http://mt.agg.md:8111/$magazin\" >/dev/null 2>&1
" >/opt/reloadVLC-AGG.sh

sleep 2

echo "*/15 * * * *    gadmin  /bin/bash /opt/reloadVLC-AGG.sh >/dev/null 2>&1" >>/etc/crontab
sleep 1
echo "DONE!"
sleep 1
