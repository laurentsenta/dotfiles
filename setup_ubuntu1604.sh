set -x

sudo apt-get install vim git
me=`whoami`

if [ "${me}" = "root" ]; then
    echo "set root password:"
    passwd
    echo "creating my user:"
    adduser laurent
    usermod -aG sudo laurent
    echo "in the next, update hostname"
    read
    vim /etc/hostname
    vim /etc/hosts
    echo "move to user laurent, wget and run again!"
fi

cd ~
mkdir .ssh/
echo "Enter your ssh public key"
cat >> .ssh/authorized_keys
echo "remove password login from ssh config (PasswordAuthentication)"
vim /etc/ssh/sshd_config

ssh-keygen -t rsa -b 4096 -C 'laurent.senta@gmail.com'
echo "go to https://github.com/settings/keys and add your new ssh key:"
cat ~/.ssh/id_rsa.pub

mkdir ~/dev
cd ~/dev
git clone 'git@github.com:lsenta/dotfiles.git'
cd dotfiles

./script/1_bootstrap
echo "setup vim, skip the errors then call :BundleInstall"
vim

./script/2_init
./script/3_install

echo "server? run ./script/4_server"










