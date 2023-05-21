#!/bin/bash

######
SERVER_USER='defaultuser'
SERVER_IP='192.168.1.63'
######

SPEC=$(ls $PWD/rpm/*.spec)
APP=$(head -20 $SPEC | grep Name: | sed 's/Name://g' | sed 's/ //g')

ssh $SERVER_USER@$SERVER_IP "ssh defaultuser@localhost \
-p 2223 \
-i ~/AuroraOS/vmshare/ssh/private_keys/sdk \
\"/usr/bin/$APP\"" &