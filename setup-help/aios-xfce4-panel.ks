# Author(s): Dylan Turner <dylantdmt@gmail.com>
# Description: Set up xfce4 panel config

%post

mkdir -p /home/liveuser/.config/xfce4/panel
mkdir -p /home/liveuser/.config/xfce4/xfconf/xfce-perchannel-xml
cat > /home/liveuser/.config/xfce4/helpers.rc << EOF
WebBrowser=custom-WebBrowser
TerminalEmulator=custom-TerminalEmulator
EOF
cat > /home/liveuser/.config/xfce4/panel/battery-10.rc << EOF
display_label=false
display_icon=true
display_power=false
display_percentage=true
display_bar=false
display_time=true
tooltip_display_percentage=true
tooltip_display_time=true
low_percentage=10
critical_percentage=5
action_on_low=1
action_on_critical=1
hide_when_full=1
colorA=rgb(136,136,255)
colorH=rgb(0,255,0)
colorL=rgb(255,255,0)
colorC=rgb(255,0,0)
command_on_low=
command_on_critical=
EOF
cat > /home/liveuser/.config/xfce4/panel/battery-7.rc << EOF
display_label=false
display_icon=true
display_power=false
display_percentage=true
display_bar=false
display_time=true
tooltip_display_percentage=true
tooltip_display_time=true
low_percentage=10
critical_percentage=5
action_on_low=1
action_on_critical=1
hide_when_full=1
colorA=rgb(136,136,255)
colorH=rgb(0,255,0)
colorL=rgb(255,255,0)
colorC=rgb(255,0,0)
command_on_low=
command_on_critical=
EOF
cat > /home/liveuser/.config/xfce4/panel/datetime-10.rc << EOF
layout=3
date_font=Bitstream Vera Sans 8
time_font=Bitstream Vera Sans 12
date_format=%Y-%m-%d
time_format=%l:%M:%S %P
EOF
cat > /home/liveuser/.config/xfce4/panel/datetime-7.rc << EOF
layout=2
date_font=Bitstream Vera Sans 12
time_font=Bitstream Vera Sans 8
date_format=%a, %b %d, %Y
time_format=%H:%M
EOF
cat > /home/liveuser/.config/xfce4/panel/datetime-9.rc << EOF
layout=2
date_font=Bitstream Vera Sans 12
time_font=Bitstream Vera Sans 8
date_format=%a, %b %d, %Y
time_format=%H:%M
EOF
cat > /home/liveuser/.config/xfce4/panel/fsguard-12.rc << EOF
yellow=8
red=2
lab_size_visible=true
progress_bar_visible=false
hide_button=false
label=
label_visible=false
mnt=/
EOF
cat > /home/liveuser/.config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>

<channel name="thunar" version="1.0">
  <property name="last-view" type="string" value="ThunarIconView"/>
  <property name="last-icon-view-zoom-level" type="string" value="THUNAR_ZOOM_LEVEL_100_PERCENT"/>
  <property name="last-separator-position" type="int" value="170"/>
  <property name="last-window-width" type="int" value="686"/>
  <property name="last-window-height" type="int" value="314"/>
  <property name="last-window-maximized" type="bool" value="false"/>
  <property name="last-show-hidden" type="bool" value="false"/>
  <property name="misc-single-click" type="bool" value="false"/>
  <property name="misc-thumbnail-mode" type="string" value="THUNAR_THUMBNAIL_MODE_ALWAYS"/>
</channel>
EOF
cat > /home/liveuser/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>

<channel name="xfce4-panel" version="1.0">
  <property name="configver" type="int" value="2"/>
  <property name="panels" type="array">
    <value type="int" value="1"/>
    <property name="dark-mode" type="bool" value="true"/>
    <property name="panel-1" type="empty">
      <property name="position" type="string" value="p=6;x=0;y=0"/>
      <property name="length" type="uint" value="100"/>
      <property name="position-locked" type="bool" value="true"/>
      <property name="icon-size" type="uint" value="20"/>
      <property name="size" type="uint" value="32"/>
      <property name="plugin-ids" type="array">
        <value type="int" value="1"/>
        <value type="int" value="2"/>
        <value type="int" value="3"/>
        <value type="int" value="4"/>
        <value type="int" value="5"/>
        <value type="int" value="6"/>
        <value type="int" value="8"/>
        <value type="int" value="10"/>
        <value type="int" value="12"/>
        <value type="int" value="13"/>
        <value type="int" value="14"/>
        <value type="int" value="11"/>
        <value type="int" value="7"/>
        <value type="int" value="15"/>
        <value type="int" value="9"/>
        <value type="int" value="16"/>
      </property>
    </property>
  </property>
  <property name="plugins" type="empty">
    <property name="plugin-1" type="string" value="applicationsmenu">
      <property name="button-icon" type="string" value="distributor-logo-fedora"/>
    </property>
    <property name="plugin-2" type="string" value="tasklist">
      <property name="grouping" type="uint" value="1"/>
    </property>
    <property name="plugin-3" type="string" value="separator">
      <property name="expand" type="bool" value="true"/>
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-4" type="string" value="pager">
      <property name="rows" type="uint" value="1"/>
      <property name="miniature-view" type="bool" value="false"/>
      <property name="numbering" type="bool" value="false"/>
    </property>
    <property name="plugin-5" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-6" type="string" value="systray">
      <property name="square-icons" type="bool" value="true"/>
      <property name="known-legacy-items" type="array">
        <value type="string" value="thunar"/>
        <value type="string" value="nextcloud"/>
        <value type="string" value="blueman"/>
        <value type="string" value="no network connection"/>
        <value type="string" value="megasync"/>
        <value type="string" value="nxclient.bin"/>
        <value type="string" value="ethernet network connection “default profile” active"/>
      </property>
      <property name="known-items" type="array">
        <value type="string" value="obs"/>
        <value type="string" value="MEGAsync"/>
        <value type="string" value="Microsoft Teams - Insiders1"/>
        <value type="string" value="zoom"/>
        <value type="string" value="discord1"/>
        <value type="string" value="Nextcloud"/>
        <value type="string" value="steam"/>
        <value type="string" value="blueman"/>
      </property>
    </property>
    <property name="plugin-8" type="string" value="pulseaudio">
      <property name="enable-keyboard-shortcuts" type="bool" value="true"/>
      <property name="show-notifications" type="bool" value="true"/>
      <property name="mpris-players" type="string" value="firefox.instance25229;firefox.instance3949;firefox.instance437631;firefox.instance4794;firefox.instance49613;firefox.instance5519;firefox.instance6638;firefox.instance7072;firefox.instance8884;spotify"/>
    </property>
    <property name="plugin-11" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-13" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-7" type="string" value="datetime"/>
    <property name="plugin-9" type="string" value="datetime"/>
    <property name="plugin-10" type="string" value="battery"/>
    <property name="plugin-12" type="string" value="fsguard"/>
    <property name="plugin-14" type="string" value="fsguard"/>
    <property name="plugin-15" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
    <property name="plugin-16" type="string" value="separator">
      <property name="style" type="uint" value="0"/>
    </property>
  </property>
</channel>
EOF

cat >> /etc/rc.d/init.d/livesys << EOF

chown -R liveuser:liveuser /home/.config/xfce4
mkdir -p /root/.config
cp -r /home/liveuser/.config/xfce4 /root/.config

EOF

%end

