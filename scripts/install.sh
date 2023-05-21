#!/bin/bash

######
SERVER_USER='defaultuser'
SERVER_IP='192.168.1.63'
######

MAC_RPM=$(ls $PWD/build/RPMS/*.rpm)
SERVER_APP_FOLDER="/home/$SERVER_USER/Projects/$APP_FOLDER"
SERVER_RPM="${MAC_RPM/*Projects\//$SERVER_APP_FOLDER}"
RPM=$(basename $SERVER_RPM)

ssh "$SERVER_USER@$SERVER_IP" "scp \
-P 2223 \
-i ~/AuroraOS/vmshare/ssh/private_keys/sdk \
$SERVER_RPM \
defaultuser@localhost:/home/defaultuser/Downloads"

ssh "$SERVER_USER@$SERVER_IP" "ssh root@localhost \
-p 2223 \
-i ~/AuroraOS/vmshare/ssh/private_keys/sdk \
\"pkcon -y install-local /home/defaultuser/Downloads/$RPM\""

ssh "$SERVER_USER@$SERVER_IP" "ssh root@localhost \
-p 2223 \
-i ~/AuroraOS/vmshare/ssh/private_keys/sdk \
\"rm /home/defaultuser/Downloads/$RPM\""