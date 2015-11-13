#!/usr/bin/env bash

select_version() {
    declare -r OS_NAME="$(uname -s)"

    if [ "$OS_NAME" == "Darwin" ]; then
        ./osx.sh
        return 0
    elif [ "$OS_NAME" == "Linux" ]; then
        declare -r XSERVER="$(dpkg -l | grep xserver | wc -l)"
        if [ "$XSERVER" != "0" ]; then
            ./ubuntu.sh
            return 0
        else
            printf 'Sorry, aparently computer has no X11 installed! Please try using vagrant'
            return 1
        fi
    else
        printf 'Sorry, this script is intended only for OS X and Ubuntu!'
    fi
    
    return 1
}

select_version || exit 1
