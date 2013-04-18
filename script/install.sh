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

apt-get install ipython python-pip python-dev
apt-get install python3

apt-get install awesome awesome-extra

apt-get install git-core git-gui git-cola
apt-get install ack-grep autojump tree

apt-get install everpad
apt-get install nautilus-dropbox

autoLinkS awesome .config/awesome

if [ "$quick" != "Y" ]; then
	apt-get install texlive-full;
fi
