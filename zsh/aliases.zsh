alias reload!='. ~/.zshrc'

function apt-search() {
  apt-cache search $1 | grep $1
}

alias apt-install='sudo apt-get install'

function cdls() {
  \cd $@ && ls
}
alias cd=cdls

function tunnel() {
  machine="$1"
  port_local="$2"
  port_remote="$2"

  if [ ! -z "$3" ]; then
    port_remote="$3"
  fi;

  echo "ssh $machine -N -L \"${port_local}:localhost:${port_remote}\""
  ssh $machine -N -L "${port_local}:localhost:${port_remote}"
}

function f() {
  if [[ -z "$2" ]]; then
    P="./"
  else
    P="$2"
  fi

  find "$P" -name "$1";
}

alias hibernate="sudo pm-hibernate"
alias mv='nocorrect mv'
alias ll='ls -la'
alias rm='trashit'
alias diff=colordiff

if [ $PLATFORM = 'linux' ]; then
  alias ack='ack-grep'
fi

# Leiningen
alias leindeps='lein do deps :tree'
alias leincheck='lein do ancient, ancient :plugins, kibit, bikeshed'
alias leincheck2='lein eastwood'

# Vagrant
function vagrant-running() {
  vagrant status | grep running > /dev/null
  if [ $? = 0 ]; then
    echo "vagrant already running"
  else
    vagrant up
  fi
}

function vagrant-force-ssh() {
  vagrant ssh
  while [ $? != 0 ]; do
      sleep 1;
      echo "attempting to vagrant ssh again";
      vagrant ssh;
  done
}

