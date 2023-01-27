# Author(s): Dylan Turner
# Description: Setup and config for zsh

%post

# Write zsh config to home dir
mkdir -p /home/liveuser
cat > /home/liveuser/.zshrc << EOF
# Plugins

if [ ! -d "\$HOME/.zsh-completions" ]; then
    git clone https://github.com/zsh-users/zsh-completions.git \$HOME/.zsh-completions
fi
export fpath=(\$HOME/.zsh-completions/src \$fpath)
autoload -U compinit && compinit
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Theme

autoload -Uz colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{red}*'   # display this when there are unstaged changes
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'  # display this when there are staged changes
zstyle ':vcs_info:*' actionformats '%F{5}(%F{2}%b%F{3}|%F{1}%a%c%u%m%F{5})%f '
zstyle ':vcs_info:*' formats '%F{5}(%F{2}%b%c%u%m%F{5})%f '
zstyle ':vcs_info:svn:*' branchformat '%b'
zstyle ':vcs_info:svn:*' actionformats '%F{5}(%F{2}%b%F{1}:%{3}%i%F{3}|%F{1}%a%c%u%m%F{5})%f '
zstyle ':vcs_info:svn:*' formats '%F{5}(%F{2}%b%F{1}:%F{3}%i%c%u%m%F{5})%f '
zstyle ':vcs_info:*' enable git cvs svn
zstyle ':vcs_info:git*+set-message:*' hooks untracked-git

+vi-untracked-git() {
  if command git status --porcelain 2>/dev/null | command grep -q '??'; then
    hook_com[misc]='%F{red}?'
  else
    hook_com[misc]=''
  fi
}

gentoo_precmd() {
  vcs_info
}

autoload -U add-zsh-hook
add-zsh-hook precmd gentoo_precmd

PROMPT='%(!.%B%F{red}.%B%F{green}%n@)%m %F{blue}%(!.%1~.%~) ${vcs_info_msg_0_}%F{blue}%(!.#.$)%k%b%f '

# Install package manager

if [ ! -f "\$HOME/Applications/appimaged-*" ]; then
    echo "Installing the appimaged..."
    aipman install appimaged
    chmod +x \$HOME/Applications/appimaged-*.AppImage
    aipman run appimaged

    echo "Installing Firefox with `aipman install firefox`!"
    aipman install firefox
fi

# Install vim plug

if [ ! -f "\$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
    echo "Setting up nvim..."
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim -c "PlugInstall || qa\!"
fi

# User configuration

export PATH="\$HOME/.local/bin:\$PATH"
export PATH="/var/lib/snapd/snap/bin:\$PATH"
export PATH="\$HOME/.cargo/bin:\$PATH"
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .vim'

alias rm="trash"
alias \$(date +%Y)='echo "YEAR OF THE LINUX DESKTOP"'

# Source /etc/profile
source /etc/profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# For compatibility
export TERM=xterm-256color
EOF

cat >> /etc/rc.d/init.d/livesys << EOF

chown liveuser:liveuser /home/liveuser/.zshrc

mkdir -p /root
cp /home/liveuser/.zshrc /root

chsh -s /usr/bin/zsh liveuser
chsh -s /usr/bin/zsh root

EOF

%end

