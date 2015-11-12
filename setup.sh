#!/bin/bash

select_version() {
    declare -r OS_NAME="$(uname -s)"

    if [ "$OS_NAME" == "Darwin" ]; then
        ./osx.sh
        return 0
    elif [ "$OS_NAME" == "Linux" ]; then
        declare -r XSERVER="$(dpkg -l | grep xserver | wc -l)"
        if [ "$XSERVER" == "0" ]; then
            ./ubuntu-server.sh
        else
            ./ubuntu.sh
        fi
        return 0
    else
        printf 'Sorry, this script is intended only for OS X and Ubuntu!'
    fi
    
    return 1
}

select_version || exit 1
