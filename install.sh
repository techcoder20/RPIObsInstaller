#!/bin/bash

rm libfdk-aac2_2.0.1-1_armhf.deb libfdk-aac-dev_2.0.1-1_armhf.deb

wget http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2_2.0.1-1_armhf.deb
wget http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.1-1_armhf.deb

sudo dpkg -i libfdk-aac2_2.0.1-1_armhf.deb
sudo dpkg -i libfdk-aac-dev_2.0.1-1_armhf.deb

rm libfdk-aac2_2.0.1-1_armhf.deb libfdk-aac-dev_2.0.1-1_armhf.deb

sudo dpkg -i ~/RPIObsInstaller/obs_armhf.deb

echo '''
[Desktop Entry]
Version=1.0
Name=OBS Studio
GenericName=Streaming/Recording Software
Comment=Free and Open Source Streaming/Recording Software
Exec=obs
Icon=obs
Terminal=false
Type=Application
Categories=AudioVideo;Recorder;
StartupNotify=true
StartupWMClass=obs
''' >> ~/.local/share/applications/obs.desktop
