# Author(s): Dylan Turner <dylantdmt@gmail.com>
# Description: Set up desktop, shell, and nvim theming

%include aios-zsh.ks
%include aios-i3.ks
%include aios-xfce4-panel.ks
%include aios-alacritty.ks
%include aios-nvim.ks

%post

cat >> /etc/rc.d/init.d/livesys << EOF

# Install the aip-man
su liveuser -c "cargo install aipman"

EOF

%end

