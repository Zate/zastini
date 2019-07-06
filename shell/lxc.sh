#!/bin/bash

# Create a standard bionic image with all my shit on it.
echo $1
lxc stop penguin --force
lxc delete debian-old
lxc rename penguin debian-old

lxc launch ubuntu:18.04 penguin
sleep 5
lxc exec penguin -- sh -c "curl -s https://files.zate.org/bionic.sh | bash -s -"
sleep 5
lxc start penguin
sleep 5
lxc exec penguin -- USER=$1 curl -s https://files.zate.org/groups.sh | bash -s -

