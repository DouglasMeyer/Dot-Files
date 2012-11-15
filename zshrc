# Path to your oh-my-zsh configuration.
ZSH=/usr/share/oh-my-zsh/
ZSH_CUSTOM="$HOME/.config/oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell" # "Default" git
ZSH_THEME="random"
#ZSH_THEME="simple" # "Default" full path, git
#ZSH_THEME="fletcherm" # full path, git, command timestamp
#ZSH_THEME="theunraveler" # git, fancy
#ZSH_THEME="afowler" # error display, full path, git, fancy


[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.shell_helpers ] && . ~/.shell_helpers

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/douglas/.rbenv/shims:./.bin:/home/douglas/.local/bin:/home/douglas/.rbenv/bin:/usr/bin:/usr/local/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/douglas/.rvm/bin
