#!/bin/bash

# exit script if return code != 0
set -e

# define pacman packages
pacman_packages="python2-pyopenssl"

# install pre-reqs
pacman -Syu --ignore filesystem --noconfirm
pacman -S --needed $pacman_packages --noconfirm

# call aur packer script
source /root/packer.sh

# set permissions
chown -R nobody:users /usr/lib/couchpotato /usr/bin/couchpotato
chmod -R 775 /usr/lib/couchpotato /usr/bin/couchpotato

# cleanup
yes|pacman -Scc
rm -rf /usr/share/locale/*
rm -rf /usr/share/man/*
rm -rf /tmp/*
