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
alias python="python3"

if which apt &> /dev/null
then
	alias y="sudo apt -y"
	alias ys="y install"
fi
if which yay &> /dev/null
then
	alias y="yay --noconfirm"
	alias ys="y -S"
fi
if which brew &> /dev/null
then
	alias y="brew"
	alias ys="y install"
	alias yse="y search"
fi

# Other exports
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/opt/gradle/latest/bin

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

