#!/bin/bash

groups ubuntu >update-groups
sed -i 'y/ /,/; s/ubuntu,:,ubuntu,/sudo usermod -aG /; s/$/ \$USER/' update-groups
killall -u ubuntu
userdel -r ubuntu
sed -i '/^ubuntu/d' /etc/sudoers.d/90-cloud-init-users
