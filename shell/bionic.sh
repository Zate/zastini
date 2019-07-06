#!/bin/bash

# Create a standard bionic image with all my shit on it.

apt-get update 
apt-get -y upgrade
echo "deb https://storage.googleapis.com/cros-packages stretch main" > /etc/apt/sources.list.d/cros.list
if [ -f cros_milestone ]; then sudo sed -i \"s?packages?packages/$(cat cros_milestone)?\" /etc/apt/sources.list.d/cros.list; fi
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1397BC53640DB551
apt-get update
apt-get install -y binutils
apt download cros-ui-config
ar x cros-ui-config_0.12_all.deb data.tar.gz
gunzip data.tar.gz
tar f data.tar --delete ./etc/gtk-3.0/settings.ini
gzip data.tar
ar r cros-ui-config_0.12_all.deb data.tar.gz
rm -rf data.tar.gz
apt install -y cros-guest-tools ./cros-ui-config_0.12_all.deb
rm cros-ui-config_0.12_all.deb
apt install -y adwaita-icon-theme-full
shutdown -h now
#lxc start penguin
#sleep 5
#lxc exec penguin -- sudo --login --user zate75 curl -s https://files.zate.org/groups.sh | bash -s -

