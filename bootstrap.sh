#!/usr/bin/env bash

# bash -c "$(curl -fsSL https://raw.githubusercontent.com/DouglasMeyer/Dot-Files/master/bootstrap.sh)"

DOT_FILES="$HOME/.local/Dot-Files"

### Script Support
    # Exit immediately if a variable isn't defined
       # Exit immediately if a command dosn't exit with 0
set -u -e

if [ -d $DOT_FILES ] ; then
  echo "Dot-Files already installed!"
  exit 1
fi

mkdir -p $DOT_FILES
git clone https://github.com/DouglasMeyer/Dot-Files.git $DOT_FILES

cd $HOME

mv .bash_profile $DOT_FILES/bash_profile || true
ln -s $DOT_FILES/bash_profile .bash_profile

mv .bashrc $DOT_FILES/bashrc || true
ln -s $DOT_FILES/bashrc .bashrc

mv .gitconfig $DOT_FILES/gitconfig || true
ln -s $DOT_FILES/gitconfig .gitconfig

mv .rvmrc $DOT_FILES/rvmrc || true
ln -s $DOT_FILES/rvmrc .rvmrc

mv .tmux.conf $DOT_FILES/tmux.conf || true
ln -s $DOT_FILES/tmux.conf .tmux.conf

mv .vimrc $DOT_FILES/vimrc || true
ln -s $DOT_FILES/vimrc .vimrc

mkdir -p .config/
mv .config/youtube-dl.conf $DOT_FILES/youtube-dl.conf || true
ln -s $DOT_FILES/youtube-dl.conf .config/youtube-dl.conf
