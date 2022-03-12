#! /usr/bin/env sh

set -o errexit          # Exit on most errors (see the manual)
set -o errtrace         # Make sure any error trap is inherited
set -o nounset          # Disallow expansion of unset variables
set -o pipefail         # Use last non-zero exit code in a pipeline
set -o xtrace           # Trace the execution of the script (debug)

if test ! "${USER}" = "pi"
  then
  exit 1
fi

sudo apt update
sudo apt install git

git clone https://github.com/laurentsenta/dotfiles.git "~/.dotfiles"
cd "~/.dotfiles/"
sh ./script/bootstrap

sudo usermod -aG docker "${USER}"
docker run hello-world

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

sudo apt install python3