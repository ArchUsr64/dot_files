export PS1="\[$(tput bold)\]\[\033[38;5;0m\]\[\033[48;5;10m\]\t\[$(tput sgr0)\]\[\033[38;5;5m\]\w\[$(tput sgr0)\]\[\033[38;5;2m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\n\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;0m\]\[\033[48;5;10m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
export _JAVA_AWT_WM_NONREPARENTING="1"

HISTSIZE=10000
HISTFILESIZE=20000

source ~/.profile
