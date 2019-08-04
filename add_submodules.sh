#!/bin/bash


BASE_DIR=`pwd`

# set -x
for d in `find dein/repos/github.com/ -maxdepth 2 -type d`; do
    cd $BASE_DIR/$d
    remote_url=`git remote get-url origin`

    if [[ $remote_url == *"dotfiles.git"* ]]; then
        continue
    fi

    cd $BASE_DIR

    echo "[+] git submodule add $remote_url $d"
    git submodule add $remote_url $d
done
