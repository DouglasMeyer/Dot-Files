#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export PATH="./.bin:$HOME/.local/bin:$HOME/.rbenv/bin:$PATH"
export LANG=en_US.utf8
eval "$(rbenv init -)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
