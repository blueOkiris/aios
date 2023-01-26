export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="gentoo"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(git zsh-completions zsh-syntax-highlighting zsh-autosuggestions)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$HOME/.local/bin:$PATH"
export PATH="/var/lib/snapd/snap/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude .vim'

alias rm="trash"
alias $(date +%Y)='echo "YEAR OF THE LINUX DESKTOP"'

# Source /etc/profile
source /etc/profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# For compatibility
export TERM=xterm-256color

# Draw some system compatibility
paleofetch --recache

