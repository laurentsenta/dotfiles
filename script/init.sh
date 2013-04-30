#! /bin/sh

# git
git submodule init
git submodule update

# ssh
mkdir -p ~/.ssh/ && cd ~/.ssh && ssh-keygen -t rsa -C "$mail" && cd -
mkdir -p ~/trash/
# everpad
sudo add-apt-repository ppa:nvbn-rm/ppa
# dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu precise main"

sudo apt-get update
