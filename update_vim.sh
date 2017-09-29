#!/bin/sh
DIR=~/dotfiles
cd $DIR &&
    git submodule init &&
    git submodule update &&
    vim -c "VundleInstall"

