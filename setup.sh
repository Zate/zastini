#!/bin/bash

sudo apt -y install ansible

curl https://raw.githubusercontent.com/Zate/zastini/master/init.yml -o init.yml

ansible-playbook init.yml