autoload colors && colors
# cheers, @ehrenmurdick
# http://github.com/ehrenmurdick/config/blob/master/zsh/prompt.zsh

if (( $+commands[git] ))
then
  git="$commands[git]"
else
  git="/usr/bin/git"
fi

git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "on %{$fg_bold[green]%}$(git_prompt_info)%{$reset_color%}"
    else
      echo "on %{$fg_bold[red]%}$(git_prompt_info)%{$reset_color%}"
    fi
  fi
}

git_prompt_info () {
 ref=$($git symbolic-ref HEAD 2>/dev/null) || return
# echo "(%{\e[0;33m%}${ref#refs/heads/}%{\e[0m%})"
 echo "${ref#refs/heads/}"
}

# This assumes that you always have an origin named `origin`, and that you only
# care about one specific origin. If this is not the case, you might want to use
# `$git cherry -v @{upstream}` instead.
need_push () {
  if [ $($git rev-parse --is-inside-work-tree 2>/dev/null) ]
  then
    number=$($git cherry -v origin/$(git symbolic-ref --short HEAD) 2>/dev/null | wc -l | bc)

    if [[ $number == 0 ]]
    then
      echo " "
    else
      echo " with %{$fg_bold[magenta]%}$number unpushed%{$reset_color%}"
    fi
  fi
}

directory_name() {
  echo "%{$fg_bold[cyan]%}%1/%\/%{$reset_color%}"
}

directory_path() {
  echo "%{$fg_bold[cyan]%}%~%{$reset_color%}"
}

battery_status() {
  if test ! "$(uname)" = "Darwin"
  then
    exit 0
  fi

  if [[ $(sysctl -n hw.model) == *"Book"* ]]
  then
    $ZSH/bin/battery-status
  fi
}

node_version() {
  if [[ "$NVM_BIN" =~ 'v[0-9]+.[0-9]+' ]]; then
    echo "%{$fg_bold[green]%}(node ${MATCH})%{$reset_color%}";
  fi

  # if [ -n "$NVM_BIN" ]
  # then
  #   version=$(echo $NVM_BIN | sed -e 's;.*node/\(.*\)/bin;\1;');
  #   echo "%{$fg_bold[green]%}(node ${version})%{$reset_color%}";
  # fi
}

smiley="%(?,%{$fg[green]%}☺%{$reset_color%},%{$fg[red]%}☹%{$reset_color%})"


# VIM mode decoration
# -------------------

# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/vi-mode/vi-mode.plugin.zsh

function zle-keymap-select zle-line-init() {
  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-keymap-select


# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}!%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

function the_host() {
	if [ "$(uname)" != "Darwin" ]; then
		echo "%{$fg_bold[yellow]%}$HOST%{$reset_color%}:"
	else
		echo ""
	fi
}

# Prompt
# ------

# export PROMPT=$'\n$(battery_status)in $(directory_name) $(git_dirty)$(need_push)\n› '
export PROMPT=$'\nin $(the_host)$(directory_path) $(git_dirty)$(need_push)\n$(vi_mode_prompt_info)› '
set_prompt () {
  export RPROMPT="$(node_version) %{$fg_bold[cyan]%}$smiley $(todo)%{$reset_color%}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
