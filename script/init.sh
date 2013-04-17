#! /bin/sh

# ssh
mkdir -p ~/.ssh/ && cd ~/.ssh && ssh-keygen -t rsa -C "$mail" && cd -
# everpad
sudo add-apt-repository ppa:nvbn-rm/ppa
# dropbox
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo add-apt-repository "deb http://linux.dropbox.com/ubuntu precise main"

sudo apt-get update
