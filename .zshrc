# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Refresh autoload autocompletion
autoload -U compinit && compinit

# ZSH config
zstyle ':omz:update' mode auto
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true" # Speed up `git status`

source $ZSH/oh-my-zsh.sh

# ZSH plugins via antigen package manager
source $HOME/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle kubectl
antigen bundle command-not-found
antigen bundle github
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done
antigen apply

# Kubernetes Popeye tool
export PATH=/usr/local/bin/popeye:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
