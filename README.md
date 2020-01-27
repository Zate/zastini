# zastini
----------------
**My scripts for setting up my crostini container**

This set of scripts is designed to serve two purposes;

### Setup my basic ChromeOS Penguin container
-------

Simply run with the following commands on a default stretch/buster penguin container to setup a default container with the basics.

#### Prep System
Update, upgrade and install latest ansible
```
sudo apt-get update && sudo apt-get -y upgrade && \
sudo apt install -y software-properties-common && \
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
sudo apt-add-repository --yes --update 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main' && \
sudo apt -y install ansible
```
#### Run Playbook via ansible-pull
Available tasks:
* **Default**
  * run the command as is
  * will simply do an apt update and apt upgrade, will not install anything else
* **Docker**
  * add `-e docker=true` to the the command
  * will install and configure docker for your user
* **Go**
  * add `-e go=true` to the the command
  * will install and configure the latest golang for your user

Run the following command as your user from the Terminal shell.  Add the extra arge for each application you want to add to the end of the command.  

For example: 
```
ansible-pull -C ansible -U https://github.com/Zate/zastini/ default.yml -e "docker=true go=true"
```
installs both docker and golang.  Remove the -e command and the pieces in the quotes to just do a base install (nothing installed, just updated).

More tasks to come, feel free to submit your own with a pull request.
  
### Build custom Ubuntu 18.04 container called udev
-------

#### Pre Install
Using this script to install a new ubuntu 18.04 container requires you execute a number of manual commands via the crosh and termina command line interfaces. This process will not harm your default penguin container. 

You should already have a working functional penguin container with the ability to enter the Terminal on that container

 **Enter the crosh shell**
 ```
 Ctrl-Alt-T
 ```

Enter the termina shell
```
vsh termina
```

Verify your penguin container is up and functioning and that lxc works.  Should see penguin up and running
```
lxc list
```

Change to the required directory, download, chmod and execute the bootstrap script (you must supply your username)
```
cd /mnt/stateful/lxd_conf/ && \
curl -s https://raw.githubusercontent.com/Zate/zastini/ansible/bootstrap.sh -o bootstrap.sh && \
chmod +x bootstrap.sh && \
./bootstrap.sh username
```
From here, the script is pretty much automated to install the basics required to get a container setup.
