# Author(s): Dylan Turner
# Description:
# - AIOS Fedora Remix
# - Based on i3 spin

%include fedora-live-base.ks
%include fedora-live-minimization.ks
%include aios-desktop.ks
%include aios-setup.ks

%post

# Remix
sed -i -e 's/Generic release/AppImageOS 37 release/g' /etc/fedora-release /etc/issue

# create /etc/sysconfig/desktop (needed for installation)

cat > /etc/sysconfig/desktop <<EOF
PREFERRED=/usr/bin/i3
DISPLAYMANAGER=/usr/sbin/lightdm
EOF

cat >> /etc/rc.d/init.d/livesys << EOF

# deactivate xfconf-migration (#683161)
rm -f /etc/xdg/autostart/xfconf-migration-4.6.desktop || :

# set up lightdm autologin
sed -i 's/^#autologin-user=.*/autologin-user=liveuser/' /etc/lightdm/lightdm.conf
sed -i 's/^#autologin-user-timeout=.*/autologin-user-timeout=0/' /etc/lightdm/lightdm.conf
#sed -i 's/^#show-language-selector=.*/show-language-selector=true/' /etc/lightdm/lightdm-gtk-greeter.conf

# set i3 as default session, otherwise login will fail
sed -i 's/^#user-session=.*/user-session=i3/' /etc/lightdm/lightdm.conf

# Show harddisk install on the desktop
sed -i -e 's/NoDisplay=true/NoDisplay=false/' /usr/share/applications/liveinst.desktop
mkdir /home/liveuser/Desktop

# this goes at the end after all other changes.
chown -R liveuser:liveuser /home/liveuser
restorecon -R /home/liveuser

# setting the wallpaper
echo "/usr/bin/feh --bg-scale /usr/share/backgrounds/default.png" >> /home/liveuser/.profile

# echoing type liveinst to start the installer
echo "echo 'Please type liveinst and press Enter to start the installer'" >> /home/liveuser/.zshrc

# fixing the installer non opening bug
echo "xhost si:localuser:root" >> /home/liveuser/.profile

EOF

%end


