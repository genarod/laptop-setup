#!/bin/bash

apps=(
    ntp
    git
    curl
    emacs24
    python-dev
    python3-dev
    python-pip
    virtualenvwrapper
    banshee
    disc-cover
    chromium-browser
    xclip
    google-talkplugin
    virtualbox-qt
    keepass2
    ffmpeg
    indicator-sound-switcher
    traceroute
    pdftk
    imagemagick
    gimp
    htop
    devede
    openssh-server
    caffeine
    tmux
)

sudo apt-get install -y ${apps[@]}
