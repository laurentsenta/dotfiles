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
  vagrant status | grep 'not running' > /dev/null
  if [ $? = 0 ]; then
    vagrant up
  else
    echo "vagrant already running"
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

function vagrant-down() {
  if [ -z $1 ]; then
    echo -n 'no parameter to match paths, suspend all vms? [y/N] '
    read yn
    case "$yn" in
      [Yy]* ) ;;
      * ) return 1 ;;
    esac
  fi

  for p in $( vagrant global-status | grep "$1" | grep running | awk '{ print $5 }' )
  do
    >&2 echo "Sutting down `basename $p`";
    cd "$p" && vagrant suspend;
  done
}

function set-iterm-tab-name() {
  if [ "$PLATFORM" = "macos" ]; then
      echo -e "\033];$1\007"
  else
      >&2 echo "only on macos in iterm2"
  fi
}

# $1 = type; 0 - both, 1 - tab, 2 - title
# # rest = text
setTerminalText () {
  local mode=$1 ; shift
  echo -ne "\033]$mode;$@\007"
}

stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

function unisync() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    >&2 echo "unisync [remote-host] [remote-root]"
    return 1
  fi

  unison -batch ~/.tmuxp "ssh://$1/$2/.tmuxp"
}

alias timeout=gtimeout
