# Author(s): Dylan Turner <dylantdmt@gmail.com>
# Description:
# - Install i3 and packages for theming/system

%packages

# Desktop packages
@^i3-desktop-environment
feh
rofi
pavucontrol
dex-autostart
xfce4-panel
xfce4-datetime-plugin
xfce4-pulseaudio-plugin
xfce4-fsguard-plugin
xfce4-battery-plugin

# Networking
NetworkManager-openconnect-gnome
NetworkManager-openvpn-gnome
NetworkManager-pptp-gnome
NetworkManager-ssh-gnome
network-manager-applet
nm-connection-editor
blueman

# User apps. TODO: Make these AppImages
thunar
thunar-archive-plugin
thunar-media-tags-plugin
thunar-volman
alacritty
neovim
system-config-printer
gnome-screenshot
gnome-system-monitor

# Theming
arc-theme
breeze-cursor-theme
papirus-icon-theme

# Used to install aip-man
cargo

# Keyring/password stuff
-gnome-keyring
polkit-kde

# Admin tools are handy to have
@admin-tools
wget
trash-cli
zsh

# Setup
util-linux-user
git

# Save some space
-autofs
-acpid
-gimp-help
-desktop-backgrounds-basic
-aspell-*                   # dictionaries are big
-gnome-terminal
-gnome-photos
-gnome-backgrounds
-gnome-icon-theme
-gnome-text-editor
-libwayland
-firefox
-flatpak
-sudo
-gnome-disk-utility

# Rebranding
-fedora-logos
-fedora-release
-fedora-release-notes
generic-release
generic-logos
generic-release-notes

%end
