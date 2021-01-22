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
sudo apt -y install libmbedtls-dev libasound2-dev libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavutil-dev libcurl4-openssl-dev libfontconfig1-dev libfreetype6-dev libgl1-mesa-dev libjack-jackd2-dev libjansson-dev libluajit-5.1-dev libpulse-dev libqt5x11extras5-dev libspeexdsp-dev libswresample-dev libswscale-dev libudev-dev libv4l-dev libvlc-dev libx11-dev libx11-xcb1 libx11-xcb-dev libxcb-xinput0 libxcb-xinput-dev libxcb-randr0 libxcb-randr0-dev libxcb-xfixes0 libxcb-xfixes0-dev libx264-dev libxcb-shm0-dev libxcb-xinerama0-dev libxcomposite-dev libxinerama-dev pkg-config python3-dev qtbase5-dev libqt5svg5-dev swig

#Removing Desktop File Created by obs
sudo rm /usr/sh

sudo sed -i '/Exec/c\Exec=MESA_GL_VERSION_OVERRIDE=3.3 obs' /usr/share/applications/com.obsproject.Studio.desktop
