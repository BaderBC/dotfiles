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
alias v="nvim"
alias ys="sudo apt install -y"

# Other exports
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Load and initialise completion system
autoload -Uz compinit
compinit

# pnpm
export PNPM_HOME="/home/bstrama/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
