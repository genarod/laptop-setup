#!/bin/bash

apps=(
    ntp
    git
    curl
    emacs-nox
    python-dev
    python3-dev
    python-pip
    virtualenvwrapper
    traceroute
    openssh-server
    tmux
)

sudo apt-get install -y ${apps[@]}
