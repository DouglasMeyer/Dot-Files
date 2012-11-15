# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Helpers
[ -f ~/.shell_helpers ] && . ~/.shell_helpers

## PROMPT
[ -f /usr/share/git/git-prompt.sh ] && . /usr/share/git/git-prompt.sh
       BLUE="\[\033[0;34m\]"
        RED="\[\033[0;31m\]"
  LIGHT_RED="\[\033[1;31m\]"
      GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
       GRAY="\[\033[00m\]"
git_or_user_host () {
  local b="$(GIT_PS1_SHOWDIRTYSTATE=t GIT_PS1_SHOWSTASHSTATE=t __git_ps1 '(%s)')"
  echo "${b:-$USER@$HOSTNAME}"
}
PS1="$GREEN\$(git_or_user_host):$BLUE\w$GRAY\$ "
case ${TERM} in
  screen)
  PS1='\[\033k\W\033\\\]'$PS1
  ;;
  dumb)
  PS1="\$"
  ;;
esac


export EDITOR='vim'
HISTSIZE=1000000

[ -f ~/.shell_aliases ] && . ~/.shell_aliases


## Completions
_git_branch_merged ()
{
  __git_complete_revlist
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
