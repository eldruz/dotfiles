#!/bin/sh

# Dotfiles "installation" script
# $XDG_CONFIG_HOME must be defined
# Creates all the symlinks for the dotfiles
# Runs the dl-plugins script for vim

# i3
ln -s i3/ ~/i3
ln -s i3status/i3status.conf ~/.i3status.conf
# newsbeuter
mkdir $XDG_CONFIG_HOME/newsbeuter
ln -s newsbeuter/config $XDG_CONFIG_HOME/newsbeuter/config
ln -s newsbeuter/urls $XDG_CONFIG_HOME/newsbeuter/urls
# ranger
mkdir $XDG_CONFIG_HOME/ranger
ln -s ranger/commands.py $XDG_CONFIG_HOME/ranger/commands.py
ln -s ranger/rc.conf $XDG_CONFIG_HOME/ranger/rc.conf
ln -s ranger/rifle.conf $XDG_CONFIG_HOME/ranger/rifle.conf
ln -s ranger/scope.sh $XDG_CONFIG_HOME/ranger/scope.sh
# vim
ln -s vim/vimrc ~/.vimrc
mkdir ~/.vim ~/.vim/bundle
sh vim/dl-plugins.sh ~/.vim/bundle
# mplayer
ln -s mplayer/ ~/.mplayer
# uzbl
ln -s uzbl/ $XDG_CONFIG_HOME/uzbl
# Xresources
ln -s Xresources ~/.Xresources
