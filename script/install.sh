#! /bin/sh
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

echo "you should 'yes Y |'"
echo "Quick Install? (Y/whatever)"
read quick

apt-get install vim vim-gtk
apt-get install emacs
apt-get install zsh

./system/gnome-terminal-colors-solarized/solarize

apt-get install ipython ipython-notebook python-pip python-dev
pip install flake8

apt-get install awesome awesome-extra

apt-get install git-core git-gui git-cola
apt-get install ack-grep autojump tree colordiff

apt-get install emacs-goodies-el
apt-get install w3m-el

apt-get install dropbox
apt-get install nautilus-dropbox
apt-get install fluxgui
apt-get install freemind

autoLinkS awesome .config/awesome

if [ "$quick" != "Y" ]; then
	apt-get install texlive-full;

	# Latex style checking
        apt-get install diction texlive-extra-utils
        wget -O /tmp/style-check-current.tar.gz http://www.cs.umd.edu/~nspring/software/style-check-current.tar.gz
	cd /tmp/
	tar -xvzf style-check-current.tar.gz
	cd style-check-0.14
	make install
	cp style-check.rb /usr/bin/

	# Leiningen Clojure
        cd /usr/bin && sudo wget https://raw.github.com/technomancy/leiningen/stable/bin/lein && sudo chmod a+x lein;
fi
