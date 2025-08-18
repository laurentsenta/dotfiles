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

sudo passwd # change your password

echo 'set PasswordAuthentication to no ok?'
read 

sudo vi /etc/ssh/sshd_config

if ! id "${USER} &>/dev/null; then
	echo create my user
	sudo adduser ${USER}
fi

echo Install docker yourself - check documentation

sudo apt install zsh

# Install latest git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update

sudo apt install -y curl vim tmux git zsh bash-completion build-essential

# Switch to USER
su ${USER}

sudo update-alternatives --config editor

if [ -z "$(ls -1 ~/.ssh/*.pub 2>/dev/null)" ]; then
	ssh-keygen -t ed25519 -C "${USER}@${HOSTNAME}"
fi

echo "Now paste your main public key"
cat >> ~/.ssh/authorized_keys

# git clone https://github.com/laurentsenta/dotfiles.git "~/.dotfiles"
cd "~/.dotfiles/"
sh ./script/bootstrap
sh ./script/install
