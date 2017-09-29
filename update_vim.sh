#!/bin/sh
DIR=~/dotfiles
    cd $DIR/.vim/bundle
    git pull
    vim -c "VundleInstall" 

