#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# remove kde plasma
# dnf5 -y remove plasma-workspace plasma-* kde-*

dnf5 -y remove                  \
	xwaylandvideobridge

dnf5 repository-keys import https://downloads.1password.com/linux/keys/1password.asc
sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://downloads.1password.com/linux/keys/1password.asc" > /etc/yum.repos.d/1password.repo'

dnf5 -y copr enable "scottames/ghostty"

# setup niri
dnf5 -y install					\
	niri						\
	alacritty					\
	gdm							\
	xdg-desktop-portal-gtk		\
	xdg-desktop-portal-gnome	\
	gnome-keyring				\
	nautilus					\
	thunar                      \
	syncthing					\
	fuzzel						\
	xwayland-satellite			\
	ghostty						\
	qt5ct						\
	qt6ct						\
	1password					\
	1password-cli				\
	neovim						\
	python3-neovim				\
	noctalia

#systemctl enable podman.socket

# systemctl --global add-wants niri.service mako.service
# systemctl --global add-wants niri.service swayidle.service
# systemctl --global add-wants niri.service swaybg.service
# systemctl --global add-wants niri.service plasma-polkit-agent.service
