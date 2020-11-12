# Set History information
export HISTFILE='.zhistory'
export HISTSIZE=5000
export SAVEHIST=5000
setopt HIST_SAVE_NO_DUPS

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ip='ip -c'
alias ll='ls -lAh'
alias py='python3'
alias pacman='sudo pacman'
alias tmux='TERM=xterm-256color tmux'
alias clock='while true; do tput clear; date +"%H : %M : %S" | figlet; sleep 1; done'
alias ..='cd ..'
alias myip='dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | grep -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}"'

powerline-daemon -q
. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh
