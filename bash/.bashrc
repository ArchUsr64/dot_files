export PS1="\[$(tput bold)\]\[\033[38;5;0m\]\[\033[48;5;10m\]\t\[$(tput sgr0)\]\[\033[38;5;5m\]\w\[$(tput sgr0)\]\[\033[38;5;2m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\n\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;0m\]\[\033[48;5;10m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
export _JAVA_AWT_WM_NONREPARENTING="1"
PATH=$PATH:$HOME/.cargo/bin:$HOME/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin:$HOME/applications
alias p='doas pacman '
alias ls='ls --color=auto'
alias d='doas '
alias pt='ping google.com'
alias rb='cargo build'
alias rbr='cargo build --release'
alias rr='cargo run '
alias rrr='cargo run --release'
alias h='helix '
alias hx='helix'
alias grep='grep --color=auto'
alias hr='helix $(find src -type f | grep main.rs) $(find src -type f) $(find lib -type f | grep lib.rs)'
alias lg='lazygit'
