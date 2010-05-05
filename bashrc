# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$COLORTERM" in
  gnome-terminal) color_prompt=yes;;
esac
if [ "$TERM" = dumb ]; then
  color_prompt=
fi

# PROMPT
       BLUE="\[\033[0;34m\]"
        RED="\[\033[0;31m\]"
  LIGHT_RED="\[\033[1;31m\]"
      GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
       GRAY="\[\033[00m\]"
function git_dirty {
    git diff --quiet 2>/dev/null || echo "‽" #"⚡⇳↕☣⥑⥌⥯⬍‽"
}
git_or_user_host () {
  local b=($(__git_ps1 '%s'))
  if [ -n "$b" ]; then
    printf "(%s%s)" "$b" "$(git_dirty)"
  else
    printf "%s" "$USERNAME@$HOSTNAME"
  fi
}
if [ "$color_prompt" = yes ]; then
  PS1="$GREEN\$(git_or_user_host):$BLUE\w$GRAY\$ "
fi
case ${TERM} in
  screen)
  PS1='\[\033k\033\\\]'$PS1
  ;;
  dumb)
  PS1="\$"
  ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ] && [ "$color_prompt" = yes ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

unset color_prompt

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi


# Completers
#SSH_COMPLETE=( $(cat ~/.ssh/known_hosts | \
#                 cut -f 1 -d ' ' | \
#                 sed -e s/,.*//g | \
#                 uniq ) )
#complete -o default -W '${SSH_COMPLETE[*]}' ssh
DATABASE_COMPLETE=( $(psql -l | awk "/$USERNAME/ { print \$1 }" ) )
complete -o default -W '${DATABASE_COMPLETE[*]}' psql dropdb
