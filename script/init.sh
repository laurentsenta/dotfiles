#! /bin/sh
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# git
git submodule init
git submodule update

# ssh
# mkdir -p ~/.ssh/ && cd ~/.ssh && ssh-keygen -t rsa -C "$mail" && cd -

mkdir -p ~/trash/

apt-get -q -y install python-software-properties software-properties-common

add-apt-repository -y ppa:kilian/f.lux
add-apt-repository -y ppa:nginx/$nginx
add-apt-repository -y ppa:git-core/ppa
add-apt-repository -y ppa:webupd8team/java

# Docker
curl -s https://get.docker.io/ubuntu/ | sudo sh

apt-get update
apt-get upgrade
