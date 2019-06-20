#!/usr/bin/env python
import urllib2
import xml.etree.ElementTree as ET
import urllib
import os

if not os.path.exists('/private/tmp/flash'):
    os.makedirs('/private/tmp/flash')

file = urllib2.urlopen('http://fpdownload.macromedia.com/get/flashplayer/update/current/xml/version_en_mac_pl.xml')
data = file.read()
file.close()

root = ET.fromstring(data)
version = None
if root.tag =="XML":
    update = root.find("update")
    if update is not None:
        version = update.attrib.get('version')
        version = version.replace(",", ".")
download = "https://fpdownload.macromedia.com/get/flashplayer/pdc/{0}/install_flash_player_osx.dmg".format(version)
testfile = urllib.URLopener()
testfile.retrieve(download, '/private/tmp/flash/install_flash_player_osx.dmg')