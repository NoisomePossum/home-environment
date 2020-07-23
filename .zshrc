# If you come from bash you might have to change your $PATH.
export GOPATH=$HOME/go
export DATADOG_ROOT=/Users/michael.shaughnessy/dd
export PATH=$HOME/bin:/usr/local/bin:$DATADOG_ROOT/devtools/bin:$GOPATH/bin:$PATH
export TO_STAGING_QUIET_ON_MERGE='false'
export TO_STAGING_NOTIFY_BEFORE_MERGE='true'

export EDITOR="/usr/local/bin/nvim"
export VISUAL="/usr/local/bin/nvim"
source ~/perl5/perlbrew/etc/bashrc

# Adding hub to FPATH for github plugin
# if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
#   FPATH=/usr/local/share/zsh/site-functions:$FPATH
# fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/michael.shaughnessy/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
DEFAULT_USER=$USER

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  # github
  fzf
  osx
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gb="git --no-pager branch"

export GREP_OPTIONS="--color=always"
# alias ls="ls -Gha"
alias vim="nvim"
alias suvim="sudo nvim"

alias flare="vim -c 'cd ~/Downloads/flare/'"
alias features="cd ~/dd/consul-config/datadog/"
alias ddoc="cd ~/dd/documentation/"
alias logs="cd ~/logstest/"
alias note="vim ~/vimwiki/index.md"
alias todo="vim ~/vimwiki/todo/Tasks.md"
alias regexbuddy="wine ~/.wine/drive_c/Program\ Files/Just\ Great\ Software/RegexBuddy\ 4/RegexBuddy4.exe"
alias rk="perl6"
alias cl="colorls"
alias ezlog="cp -r ~/sandbox/ubuntu/xenial-16.04/ez-logs-tailing"
alias ezdock="cp -r ~/sandbox/ubuntu/xenial-16.04/ez-docker-logs"
alias ddlog="rk ~/raku/raku-projects/ddlog-forwarder/ddforward.raku"

alias gitbranchname="git rev-parse --abbrev-ref HEAD"
alias gitreponame='basename `git rev-parse --show-toplevel`'
alias github='open https://github.com/DataDog/`gitreponame`/compare/`gitbranchname`'
# alias gsquash='git rebase --interactive HEAD~'

# Logs devenv shortcuts
alias logs_start="cd $DATADOG_ROOT/logs-devenv;./devenv.sh start"
alias logs_stop="cd $DATADOG_ROOT/logs-devenv;./devenv.sh stop"
alias logs_f="export DEVENV_MODE=FRONTEND"
alias logs_b="export DEVENV_MODE=BACKEND"
alias logs_o="export DEVENV_MODE=BACKEND_ONLY"
alias logs_ecr="export DEVENV_USE_ECR=1"
alias maven_install="mvn install clean -DskipTests"

eval "$(jira --completion-script-zsh)"
# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
if which plenv > /dev/null; then eval "$(plenv init - zsh)"; fi

# add syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# store key in the login keychain instead of aws-vault managing a hidden keychain
export AWS_VAULT_KEYCHAIN_NAME=login

# tweak session times so you dont have to re-enter passwords every 5min
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h
