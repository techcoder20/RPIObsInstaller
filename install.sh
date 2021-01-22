#!/bin/bash

#Removing Deb files if already downloaded
rm libfdk-aac2_2.0.1-1_armhf.deb libfdk-aac-dev_2.0.1-1_armhf.deb

#Downloading deb files
wget http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2_2.0.1-1_armhf.deb
wget http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.1-1_armhf.deb

#Installing Deb Files
sudo dpkg -i libfdk-aac2_2.0.1-1_armhf.deb
sudo dpkg -i libfdk-aac-dev_2.0.1-1_armhf.deb

#Removing deb files after installation
rm libfdk-aac2_2.0.1-1_armhf.deb libfdk-aac-dev_2.0.1-1_armhf.deb

#Installing Obs
sudo dpkg -i ~/RPIObsInstaller/obs_armhf.deb
sudo apt -y --fix-broken install

#Installing Dependencies
sudo apt -y install libxcb*



sudo rm /usr/share/applications/com.obsproject.Studio.desktop

echo '''
[Desktop Entry]
Version=1.0
Name=OBS Studio
Comment=Free and Open Source Streaming/Recording Software
Exec=MESA_GL_VERSION_OVERRIDE=3.3 obs
Icon=com.obsproject.Studio
Terminal=false
Type=Application
Categories=AudioVideo;Recorder;
StartupNotify=true
StartupWMClass=obs
''' >> /usr/share/applications/com.obsproject.Studio.desktop
