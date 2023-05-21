#!/bin/bash

######
SERVER_USER='defaultuser'
SERVER_IP='192.168.1.63'
######

APP_FOLDER=$(basename $PWD)
PSDK_DIR='~/AuroraPlatformSDK/sdks/aurora_psdk'
SERVER_APP_FOLDER="/home/defaultuser/Projects/$APP_FOLDER"

rm -rf ./build
mkdir ./build

echo 00000 | ssh -tt $SERVER_USER@$SERVER_IP \
"$PSDK_DIR/sdk-chroot mb2 --target AuroraOS-4.0.2-i486 build /parentroot$SERVER_APP_FOLDER/build"

ssh $SERVER_USER@$SERVER_IP "mv *.*.* ~/Projects/$APP_FOLDER/build &> /dev/null \
mv main.o ~/Projects/$APP_FOLDER/build &> /dev/null \
mv documentation.list ~/Projects/$APP_FOLDER/build &> /dev/null \
mv translations ~/Projects/$APP_FOLDER/build &> /dev/null \
mv Makefile ~/Projects/$APP_FOLDER/build &> /dev/null \
mv rpmbuild ~/Projects/$APP_FOLDER/build &> /dev/null \
mv RPMS ~/Projects/$APP_FOLDER/build &> /dev/null"