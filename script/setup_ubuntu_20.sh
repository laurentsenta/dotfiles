#! /bin/bash

# Run this with
# curl -o- https://raw.githubusercontent.com/laurentsenta/dotfiles/main/script/setup_ubuntu_20.sh | bash

set -o errexit          # Exit on most errors (see the manual)
set -o errtrace         # Make sure any error trap is inherited
set -o nounset          # Disallow expansion of unset variables
set -o pipefail         # Use last non-zero exit code in a pipeline
set -o xtrace           # Trace the execution of the script (debug)

if [ "`uname`" != "Linux" ]; then
    echo "should be run on Ubuntu 20";
    exit 1;
fi

if [ "$(whoami)" != "root" ]; then
    echo "should be run as sudo";
    exit 2;
fi

# move to root
# if [ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@";

HOSTNAME=`hostname`
USER="laurent"

echo "Installing for hostname: ${HOSTNAME} & creating user: ${USER}"

sudo apt update
sudo apt upgrade

# sudo passwd # change your password

echo 'set PasswordAuthentication to no'
read 

sudo vi /etc/ssh/sshd_config

# create my user
sudo adduser ${USER}

# Install docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update

apt-cache policy docker-ce
sudo apt install docker-ce

sudo systemctl status docker

sudo usermod -aG docker ${USER}
sudo usermod -aG sudo ${USER}

docker run hello-world

# Install docker compose
sudo add-apt-repository universe
sudo apt update
sudo apt install docker-compose

# Install latest git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git

# Install NGINX
sudo apt install nginx
sudo ufw allow 'Nginx Full'
systemctl status nginx

# add  a URL: sudo certbot --nginx -d example.com -d www.example.com

# Install CERTBOT
sudo apt install certbot python3-certbot-nginx
# sudo certbot --nginx -d example.com -d www.example.com

# install tmux
sudo apt install tmux

sudo apt update
sudo apt install bash-completion -y


# Install VIM
sudo apt install vim

# Install nvm-related
sudo apt install curl

# Make
sudo apt install build-essentials

# Switch to USER
su ${USER}

sudo update-alternatives --config editor
ssh-keygen -t ed25519 -C "${USER}@${HOSTNAME}"

echo "now paste your public"
cat >> ~/.ssh/authorized_keys

git clone https://github.com/laurentsenta/dotfiles.git "~/.dotfiles"
cd "~/.dotfiles/"
sh ./script/bootstrap
sh ./script/install

# pupetteer
# sudo apt install -y ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils libxshmfence1

# 