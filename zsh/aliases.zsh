alias reload!='. ~/.zshrc'

function apt-search() {
  apt-cache search $1 | grep $1
}

function cdls() {
  \cd $@ && ls
}
alias cd=cdls

alias hibernate="sudo pm-hibernate"
alias mv='nocorrect mv'

