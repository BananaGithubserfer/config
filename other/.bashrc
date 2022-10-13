source ~/.bashrc_colors
source ~/.hi

export HISTCONTROL=ignoredups:erasedups 
export MANPAGER="nvim +Man! -o - "
export EDITOR="nvim"
export LS_COLORS="di=1;36:ln=01;33"

stty intr ^k

alias sudo='sudo '
alias mkdir='mkdir -pv'
alias rm="rm -rf"
alias la="ls -A"
alias sduo="sudo"
alias py3="python3"
alias g="g++"
alias torr="sudo rc-service tor restart"
alias tortr="sudo rc-service tor-telegram restart"
alias starttor="sudo rc-service iptables start"
alias stoptor="sudo rc-service iptables stop"
alias unl="sudo rm /var/lib/pacman/db.lck"
alias cl='yay -Rns $(pacman -Qtdq) && yay -Sc' 
alias cp="cp -ir"
alias mv='mv -i'
alias ip='ip -color=auto'
alias md="mkdir"

PS1="
$BGreen┌──$BRed $(whoami)$BGreen@$BCyan\h$RstColor$RstColor $IYellow[\$PWD]$RstColor \n$BGreen└─> $IWhite"
