alias reload!='. ~/.zshrc'

function apt-search() {
  apt-cache search $1 | grep $1
}

alias apt-install='sudo apt-get install'

function cdls() {
  \cd $@ && ls --color
}
alias cd=cdls

alias hibernate="sudo pm-hibernate"
alias mv='nocorrect mv'
alias ls='ls --color'
alias ll='ls -la'
alias rm='trashit'
alias diff=colordiff

