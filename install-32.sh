#!/bin/bash

function error {
  echo -e "\\e[91m$1\\e[39m"
  exit 1
}

#Updating apt packages
sudo apt update

#Installing Dependencies
sudo apt -y install libmbedtls-dev libasound2-dev libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavutil-dev libcurl4-openssl-dev libfontconfig1-dev libfreetype6-dev libgl1-mesa-dev libjack-jackd2-dev libjansson-dev libluajit-5.1-dev libpulse-dev libqt5x11extras5-dev libspeexdsp-dev libswresample-dev libswscale-dev libudev-dev libv4l-dev libvlc-dev libx11-dev libx11-xcb1 libx11-xcb-dev libxcb-xinput0 libxcb-xinput-dev libxcb-randr0 libxcb-randr0-dev libxcb-xfixes0 libxcb-xfixes0-dev libx264-dev libxcb-shm0-dev libxcb-xinerama0-dev libxcomposite-dev libxinerama-dev pkg-config python3-dev qtbase5-dev libqt5svg5-dev swig || error "Unable to install dependencies :("

#Removing Deb files if already downloaded
rm -f ~/libfdk-aac2_2.0.1-1_armhf.deb ~/libfdk-aac-dev_2.0.1-1_armhf.deb ~/obs_armhf.deb

#Downloading deb files
wget http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac2_2.0.1-1_armhf.deb -O ~/libfdk-aac2_2.0.1-1_armhf.deb || error "Failed to download libfdk-aac2_2.0.1-1_armhf.deb"
wget http://ftp.debian.org/debian/pool/non-free/f/fdk-aac/libfdk-aac-dev_2.0.1-1_armhf.deb -O ~/libfdk-aac-dev_2.0.1-1_armhf.deb || error "Failed to download libfdk-aac-dev_2.0.1-1_armhf.deb"
wget https://github.com/techcoder20/RPIObsInstaller/blob/main/obs_armhf.deb?raw=true -O ~/obs_armhf.deb || error "Failed to download obs_armhf.deb"

#Installing Deb Files
sudo apt -y install --fix-missing ~/libfdk-aac2_2.0.1-1_armhf.deb || error "Failed to install ~/libfdk-aac2_2.0.1-1_armhf.deb"
sudo apt -y install --fix-missing ~/libfdk-aac-dev_2.0.1-1_armhf.deb || error "Failed to install ~/libfdk-aac-dev_2.0.1-1_armhf.deb"
sudo apt -y install --fix-missing ~/obs_armhf.deb || error "Failed to install ~/obs_armhf.deb"

#Removing deb files after installation
sudo rm -f ~/libfdk-aac2_2.0.1-1_armhf.deb ~/libfdk-aac-dev_2.0.1-1_armhf.deb ~/obs_armhf.deb

sudo mv /usr/bin/obs /usr/bin/obs-exec
echo '#!/bin/bash
MESA_GL_VERSION_OVERRIDE=3.3 /usr/bin/obs-exec' | sudo tee /usr/bin/obs >/dev/null
sudo chmod +x /usr/bin/obs
