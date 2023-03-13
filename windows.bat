@echo off

# Install Scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
irm get.scoop.sh | iex

# Install packages
scoop install 7zip dark diffutils fd file git grep gzip python ripgrep uutils-coreutils

# Install extra packages
scoop bucket add extras
scoop install firefox googlechrome keepassxc notepadplusplus spotify whatsapp zoom
