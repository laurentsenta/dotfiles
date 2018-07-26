alias reload!='. ~/.zshrc'

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

function set-iterm-tab-name() {
  if [ "$PLATFORM" = "macos" ]; then
      echo -e "\033];$1\007"
  else
      >&2 echo "only on macos in iterm2"
  fi
}

alias timeout=gtimeout

# Docker not found in intellij:
alias fixintellij="sudo launchctl config user path $PATH"

function notif() {
  osascript -e "display notification \"$2\" with title \"$1\"";
}
