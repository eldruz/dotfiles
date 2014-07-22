#!/bin/sh

# A script to download all my vim plugins
# It is assumed Pathogen is used to handle the installation
# https://github.com/tpope/vim-pathogen 
# $1 : path to download the files
#      typically ~/.vim/bundle

# Ctrl-p
git clone https://github.com/kien/ctrlp.vim.git $1/ctrlp.vim
# vim-airline
git clone https://github.com/bling/vim-airline.git $1/vim-airline
# vim-colors-solarized
git clone https://github.com/altercation/vim-colors-solarized.git $1/vim-colors-solarized
# haskellmode-vim
git clone https://github.com/lukerandall/haskellmode-vim.git $1/haskellmode-vim
# ghcmod-vim
git clone https://github.com/eagletmt/ghcmod-vim.git $1/ghcmod-vim
# neco-ghc
git clone https://github.com/eagletmt/neco-ghc.git $1/neco-ghc
# syntastic
git clone https://github.com/scrooloose/syntastic.git $1/syntastic

