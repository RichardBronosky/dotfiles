#!/usr/bin/env bash

# Usage:
#   curl -sSL http://bit.ly/brunossh | bash

mkdir -p ~/.ssh
chmod 700 ~/.ssh

cd ~/.ssh
curl -sL https://raw.githubusercontent.com/RichardBronosky/dotfiles/DevOps/.ssh/id_rsa.pub >> authorized_keys
