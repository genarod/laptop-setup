#!/usr/bin/env bash

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
    vagrant
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
    flashplugin-installer
    transmission
    vlc
    pv
)

sudo apt-get update
sudo apt-get install -y ${apps[@]}

# For Oracle Java
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer
sudo apt-get install -y oracle-java7-set-default
