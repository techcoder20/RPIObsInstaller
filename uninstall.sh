#!/bin/bash

#Uninstalling OBS
sudo apt -y purge obs

#Removing Desktop File
rm ~/.local/share/applications/com.obsproject.Studio.desktop
