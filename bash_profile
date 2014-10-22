#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export LANG=en_US.utf8
export PATH="$HOME/.local/bin:./.bin:./node_modules/.bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
