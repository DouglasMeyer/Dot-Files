# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Helpers
[ -f ~/.local/Dot-Files/shell_helpers ] && . ~/.local/Dot-Files/shell_helpers

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
      green="\[\033[0;32m\]"
       blue="\[\033[0;34m\]"
        red="\[\033[0;31m\]"
  light_red="\[\033[1;31m\]"
      reset="\[\033[0m\]"

export PROPMPT_DIRTRIM=3
dot="\342\200\242"
PS1="${light_red}\${?#0}${green}\$(GIT_PS1_SHOWSTASHSTATE=t __git_ps1 '%s')${blue}\w${reset}${dot}"
print_pre_prompt() {
  PS1R="[$(date +%T)]"
  columns=$(tput cols)
  #printf "\033[0;31m%$((${columns-80}))s\033[00m\r" "$PS1R"
  printf "%$((${columns-80}))s\r" "$PS1R"
}
PROMPT_COMMAND=print_pre_prompt


export EDITOR='vim'
export BROWSER='chromium'
HISTSIZE=10000000

[ -f ~/.local/Dot-Files/shell_aliases ] && . ~/.local/Dot-Files/shell_aliases


## Completions
_git_branch_merged ()
{
  __git_complete_revlist
}
_git_base_diff ()
{
  _git_diff
}

#eval "$(beet completion)"
