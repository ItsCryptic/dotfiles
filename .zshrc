# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "MAHcodes/distro-prompt"
plug "zap-zsh/sudo"
plug "zsh-users/zsh-history-substring-search"
plug "hlissner/zsh-autopair"

alias lsblk="lsblk -e 7"
alias vim=nvim
alias neofetch=fastfetch
alias cd=z
alias ls="eza -l --icons --git -a"

export PATH="$PATH:/home/kevin/.local/bin"
export player="spotify"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Load and initialise completion system
autoload -Uz compinit
compinit
eval "$(zoxide init zsh)"
