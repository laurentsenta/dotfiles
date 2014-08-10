#! /bin/sh
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

HOME=~
INSTALL=`pwd`
mail="laurent.senta@gmail.com"

oldIfExist()
{
    if [ -e "$1" ]; then
        oldIfExist "$1-old"

        mv "$1" "$1-old"
    fi
}

autoLink()
{
    real="$INSTALL/$1"
    dest="$HOME/$2"

    oldIfExist "$dest"
    ln "$real" "$dest" $3
}

autoLinkS()
{
    autoLink $1 $2 -s
}

# echo "you should 'yes Y |'"
# echo "Quick Install? (Y/whatever)"
# read quick

# Colors
./system/gnome-terminal-colors-solarized/solarize

apt-get -q -y install vim vim-gtk zsh \
	ipython ipython-notebook python-pip python-dev

apt-get -q -y install awesome awesome-extra \
	git-core \
	ack-grep autojump tree colordiff grc

apt-get -q -y install dropbox nautilus-dropbox fluxgui freemind

autoLinkS awesome .config/awesome

pip install flake8

# Leiningen Clojure
cd /usr/bin && sudo wget https://raw.github.com/technomancy/leiningen/stable/bin/lein && sudo chmod a+x lein;


