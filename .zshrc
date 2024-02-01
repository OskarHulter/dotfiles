# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="agnoster"

plugins=(gh zoxide vi-mode rsync nvm node fzf fd fig docker docker-compose brew alias-finder yarn ripgrep)

zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes   # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes    # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes  # disabled by default
zstyle ':omz:plugins:nvm' lazy yes

source $ZSH/oh-my-zsh.sh

# User configuration
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
export EDITOR='nvim'
# fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias omzsh="nvim ~/.oh-my-zsh"
alias zshrc="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias wm="zellij"
alias lg="lazygit"
alias ld="lazydocker"
alias diff="difftastic"
alias fe="yazi"
alias ls="yazi"
alias explorer="yazi"
alias exp="yazi"
alias gitconfig="git config --list --show-origin"

export PATH=$HOME/nvim-macos/bin:$PATH
export PATH="/Users/osh/bin:$PATH"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/osh/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
NVM_HOMEBREW=$(brew --prefix nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
# export VAULT_ADDR="https://vault.org.com"
# export VAULT_AUTH_GITHUB_TOKEN=""

# shell tools
# eval "$(zellij setup --generate-auto-start zsh)"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# bun completions
[ -s "/Users/osh/.bun/_bun" ] && source "/Users/osh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
