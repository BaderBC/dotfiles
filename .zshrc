# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# My own plugins:
plug "zap-zsh/sudo"
plug "chivalryq/git-alias"
plug "hlissner/zsh-autopair"

# Aliases:
alias c="clear"
alias q="exit"

# Load and initialise completion system
autoload -Uz compinit
compinit
