source ~/.bashrc_colors
source ~/.hi

shopt -s histappend
shopt -s autocd
shopt -s checkwinsize
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTCONTROL=ignoredups:erasedups 
export MANPAGER="nvim +Man! -o - "
export EDITOR="nvim"
export LS_COLORS="di=1;36:ln=01;33"

stty intr ^k
alias wifi="nmcli dev wifi"
alias pydoc="python3 -m pydoc"
#alias cl='yay -Rns $(pacman -Qtdq) && yay -Sc'
#alias serve="browser-sync start --server --no-online --no-notify --files ."
alias ctor="curl -s https://check.torproject.org/api/ip"
alias clear="clear && ~/.hi"
alias sudo="sudo "
alias mkdir="mkdir -pv"
alias rm="rm -rf"
alias la="ls -Atr"
alias ls="ls -ctr --color=auto"
alias sduo="sudo "
alias py3="python3 -i ~/.config/calc.py"
alias torr="sudo sv restart tor"
alias tortr="sudo sv restart tor-telegram"

alias starttor="sudo loadiptables"
alias stoptor="sudo flushiptables"

alias unl="sudo rm /var/lib/pacman/db.lck"
alias cp="cp -r"
#alias mv="mv -i"
alias md="mkdir"
alias mitmproxyrun="proxychains4"
alias find="find 2>>/dev/null"

PS1="
$BGreen┌──$BRed $(whoami)$BGreen@$BCyan\h$RstColor$RstColor $IYellow[\$PWD]$RstColor\n$BGreen└─> $IWhite"
