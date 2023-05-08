export PS1="\[$(tput bold)\]\[\033[38;5;0m\]\[\033[48;5;10m\]\t\[$(tput sgr0)\]\[\033[38;5;5m\]\w\[$(tput sgr0)\]\[\033[38;5;2m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\n\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;0m\]\[\033[48;5;10m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
PATH=$PATH:$HOME/.cargo/bin:.
alias remove='/usr/bin/rm '
alias rm='trash '
alias p='pacman '
alias ls='ls --color=auto'
alias d='doas '
alias pt='ping google.com'
alias rr='cargo run '
alias lg='lazygit '
alias hx='helix'
