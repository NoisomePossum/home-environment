LBLUE='\[\e[36m\]'
WHITE='\[\e[37m\]'
PS1="\n${LBLUE}[\w] ${WHITE}\$ "
export CLICOLOR=1
export LSCOLORS=cxfxhxhxbxhxhxhxbxbxcxcx

export EDITOR="/usr/local/bin/nvim"
export VISUAL="/usr/local/bin/nvim"

export GREP_OPTIONS="--color=always"
alias ls="ls -Gha"
alias ovim="/usr/local/bin/vim"
alias vim="nvim"

alias flare="vim -c 'cd ~/Downloads/flare/'"
alias features="cd ~/dd/consul-config/datadog/"
alias ddoc="cd ~/dd/documentation/"
alias logs="cd ~/logstest/"
