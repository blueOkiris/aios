# Author(s): Dylan Turner <dylantdmt@gmail.com>
# Description: Set up desktop, shell, and nvim theming

%include setup-help/aios-zsh.ks
%include setup-help/aios-i3.ks
%include setup-help/aios-xfce4-panel.ks
%include setup-help/aios-alacritty.ks
%include setup-help/aios-nvim.ks
%include setup-help/aios-gtk-theme.ks

%post

cat >> /etc/rc.d/init.d/livesys << EOF

# Install the aip-man
su liveuser -c "cargo install aipman"

# Install basic applications
su liveuser -c "aipman install appimaged"
su liveuser -c "aipman run appimaged"
su liveuser -c "aipman install firefox"
su liveuser -c "aipman install libreoffice-fresh-basic"
su liveuser -c "aipman install spotify"
su liveuser -c "aipman install nextcloud"

EOF

%end

