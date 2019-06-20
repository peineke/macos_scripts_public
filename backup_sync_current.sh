#!/bin/bash

mkdir /private/tmp/Drive
cd /private/tmp/Drive


curl -L -O "https://dl-ssl.google.com/drive/InstallBackupAndSync.dmg"
hdiutil mount -nobrowse InstallBackupAndSync.dmg
cp -R "/Volumes/Install Backup and Sync from Google/Backup and Sync.app" /Applications
hdiutil unmount "/Volumes/Install Backup and Sync from Google"
rm -R /private/tmp/Drive