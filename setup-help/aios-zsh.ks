# Author(s): Dylan Turner
# Description: Setup and config for zsh

%post

# Write zsh config to home dir
mkdir -p /home/liveuser
cat > /home/liveuser/.zshrc << EOF
if [ -d "\$HOME/.oh-my-zsh" ]; then
    export ZSH="\$HOME/.oh-my-zsh"
    ZSH_THEME="gentoo"

    zstyle ':omz:update' mode auto      # update automatically without asking

    plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions)
    autoload -U compinit && compinit

    source \$ZSH/oh-my-zsh.sh
else
    git clone https://github.com/blueOkiris/aios /tmp/aios
    cp -r /tmp/aios/.oh-my-zsh \$HOME/.oh-my-zsh
    mv \$HOME/.oh-my-zsh/git \$HOME/.oh-my-zsh/.git
    chown -R \$USER:\$USER \$HOME/.oh-my-zsh

    if [ -d "\$HOME/.oh-my-zsh" ]; then
        export ZSH="\$HOME/.oh-my-zsh"
        ZSH_THEME="gentoo"

        zstyle ':omz:update' mode auto      # update automatically without asking

        plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions)
        autoload -U compinit && compinit

        source \$ZSH/oh-my-zsh.sh
    fi
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

