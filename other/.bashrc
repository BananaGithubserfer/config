source ~/.bashrc_colors
source ~/.hi

shopt -s histappend
shopt -s autocd
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTCONTROL=ignoredups:erasedups 
export MANPAGER="nvim +Man! -o - "
export EDITOR="nvim"
export LS_COLORS="di=1;36:ln=01;33"

stty intr ^k
#alias cl='yay -Rns $(pacman -Qtdq) && yay -Sc'
alias hibernate="bash ~/.config/sway/hibernate.sh"
alias serve="browser-sync start --server --no-online --no-notify --files ."
alias clear="clear && ~/.hi"
alias sudo="sudo "
alias mkdir="mkdir -pv"
alias rm="rm -rf"
alias la="ls -A"
alias sduo="sudo "
alias py3="python3"
alias g="g++"
alias torr="sudo rc-service tor restart"
alias tortr="sudo rc-service tor-telegram restart"
alias starttor="sudo rc-service iptables start"
alias stoptor="sudo rc-service iptables stop"
alias unl="sudo rm /var/lib/pacman/db.lck"
alias cp="cp -r"
#alias mv="mv -i"
alias ip="ip -color=auto"
alias md="mkdir"
alias find="find 2>>/dev/null"
source /usr/share/bash-completion/completions/sudo
complete -F _sudo sduo

PS1="
$BGreen┌──$BRed $(whoami)$BGreen@$BCyan\h$RstColor$RstColor $IYellow[\$PWD]$RstColor\n$BGreen└─> $IWhite"

