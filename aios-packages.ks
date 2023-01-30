# Author(s): Dylan Turner <dylantdmt@gmail.com>
# Description: Packages for live system

%packages

# Desktop packages
@i3-desktop-environment
-i3
-i3-config-fedora
i3-gaps
feh
rofi
dex-autostart
xfce4-panel
xfce4-datetime-plugin
xfce4-pulseaudio-plugin
xfce4-fsguard-plugin
xfce4-battery-plugin
git
zsh
zsh-syntax-highlighting
zsh-autosuggestions
coreutils
trash-cli
util-linux-user
sqlite
dbus-daemon
avahi-tools

# Keyring/password stuff
-gnome-keyring
polkit-kde

# Theming
arc-theme
breeze-cursor-theme
papirus-icon-theme

# Networking
NetworkManager-openconnect-gnome
NetworkManager-openvpn-gnome
NetworkManager-pptp-gnome
NetworkManager-ssh-gnome
network-manager-applet
nm-connection-editor
blueman

# AIOS Specific
aipman
aipster
aios-themer
aios-default-appimages

# User apps. TODO: Make these AppImages
thunar
thunar-archive-plugin
thunar-media-tags-plugin
thunar-volman
alacritty
gnome-screenshot

# For nvim
python-i3ipc
python-neovim
nodejs
yarnpkg
cargo

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
-gnome-disk-utility
-gnome-system-monitor
-system-config-printer
-@fonts
-@input-methods
-@admin-tools
-dracut-config-rescue
dracut-config-generic

# Rebranding
-fedora-logos
-fedora-release
-fedora-release-notes
generic-release
generic-logos
generic-release-notes

%end
