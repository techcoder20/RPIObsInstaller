#!/bin/bash

#Uninstalling dependencies
sudo apt -y purge libfdk-aac2 libfdk-aac-dev obs

#Removing Desktop File
rm ~/.local/share/applications/com.obsproject.Studio.desktop
