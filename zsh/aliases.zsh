alias reload!='. ~/.zshrc'

function apt-search() {
  apt-cache search $1 | grep $1
}

alias apt-install='sudo apt-get install'

function cdls() {
  \cd $@ && ls --color
}
alias cd=cdls

function tunnel() {
  machine="$1"
  port="$2"
  ssh $machine -L "${port}:localhost:${port}"
}

function f() {
  if [[ -z "$2" ]]; then
    $2="./"
  fi

  find "$2" -name "$1";
}

alias hibernate="sudo pm-hibernate"
alias mv='nocorrect mv'
alias ls='ls --color'
alias ll='ls -la'
alias rm='trashit'
alias diff=colordiff

