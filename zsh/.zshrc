# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

setopt prompt_subst

function git_branch_name() {
  echo $(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
}

PROMPT='%B%K{10}%F{black}%*%f%k%b%F{5}%~%F{green}$(git_branch_name)
%B%K{10}%F{black}%#%f%k%b '

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000
bindkey -e

bindkey -s ^f "^utmux-sessionizer\n"

zstyle :compinstall filename '/home/me/.zshrc'
autoload -U select-word-style
select-word-style bash
setopt globdots

autoload -Uz compinit
compinit

source ~/.profile

unsetopt share_history
