#! /bin/sh

# git
git submodule init
git submodule update

# ssh
mkdir -p ~/.ssh/ && cd ~/.ssh && ssh-keygen -t rsa -C "$mail" && cd -
mkdir -p ~/trash/

sudo add-apt-repository ppa:kilian/f.lux
sudo apt-get update
