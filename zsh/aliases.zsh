alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

function cdls() {
  \cd $@ && ls
}
alias cd=cdls

alias rm=trashit

alias ll='ls -la'

alias diff=colordiff

alias g=git
