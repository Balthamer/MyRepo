# Command Completion, use tab twice to use menu select
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Set History information
export HISTFILE='/home/balthamer/.zhistory'
export HISTSIZE=5000
export SAVEHIST=5000
setopt HIST_SAVE_NO_DUPS

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tree='tree -C'
alias ip='ip -c'
alias ll='ls -lh'
alias la='ls -lAh'
alias py='python3'
alias pacman='sudo pacman'
alias tmux='TERM=xterm-256color tmux'
alias clock='while true; do tput clear; date +"%H : %M : %S" | figlet; sleep 1; done'
alias ..='cd ..'
alias myip='echo -n "Private IP: " && ip -br addr show wlp2s0 | grep -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}" && echo -n "Public IP: " && dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com | grep -Eo "([0-9]{1,3}\.){3}[0-9]{1,3}"'

case "$TERM" in
    xterm-color|*-256color|xterm) powerline-daemon -q
        . /usr/share/powerline/bindings/zsh/powerline.zsh
esac
case "$TERM" in
    linux) PS1='%F{cyan}%n@%m%~>>%F{white} '
esac
