# google-cloud-sdk brew caveat
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# BEGIN ANSIBLE MANAGED BLOCK
# Add homebrew binaries to the path.
fish_add_path /usr/local/bin
fish_add_path /opt/homebrew/bin

# Force certain more-secure behaviours from homebrew
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# eval "(nodenv init -)"
# Load ruby shims
# eval "(rbenv init -)"

# Prefer GNU binaries to Macintosh binaries.
fish_add_path /usr/local/opt/coreutils/libexec/gnubin

# Add AWS CLI to PATH
fish_add_path /usr/local/opt/awscli@1/bin

# Add datadog devtools binaries to the PATH
fish_add_path $HOME/dd/devtools/bin

# Point GOPATH to our go sources
export GOPATH="$HOME/go"

# Point DATADOG_ROOT to ~/dd symlink
export DATADOG_ROOT="$HOME/dd"

# Tell the devenv vm to mount $GOPATH/src rather than just dd-go
export MOUNT_ALL_GO_SRC=1

# store key in the login keychain instead of aws-vault managing a hidden keychain
export AWS_VAULT_KEYCHAIN_NAME=login

# tweak session times so you don't have to re-enter passwords every 5min
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h

# Helm switch from storing objects in kubernetes configmaps to
# secrets by default, but we still use the old default.
export HELM_DRIVER=configmap

# Go 1.16+ sets this variable to off by default with the intention to
# remove it in Go 1.18, which breaks projects using the dep tool.
# https://blog.golang.org/go116-module-changes
export GO111MODULE=auto
# END ANSIBLE MANAGED BLOCK

status is-login; and pyenv init --path | source
pyenv init - | source
fish_add_path /usr/local/opt/ruby/bin
fish_add_path /usr/local/Cellar/rakudo/2021.12/share/perl6/site/bin
fish_add_path /usr/local/lib/ruby/gems/3.1.2/bin
fish_add_path /opt/homebrew/Caskroom/google-cloud-sdk/490.0.0/google-cloud-sdk/bin

fish_vi_key_bindings
export EDITOR="/usr/local/bin/nvim"
export VISUAL="/usr/local/bin/nvim"


# export JAVA_HOME=(/usr/libexec/java_home -v 15)

# old-style highlighting
set fish_color_normal normal
set fish_color_command 81a1c1
set fish_color_param cyan
set fish_color_redirection brblue
set fish_color_comment red
set fish_color_error brred
set fish_color_escape bryellow --bold
set fish_color_operator bryellow
set fish_color_end brmagenta
set fish_color_quote yellow
set fish_color_autosuggestion 555 brblack
set fish_color_user brgreen

# set fish_color_normal normal
# set fish_color_command 8fbcbb
# set fish_color_quote a3be8c
# set fish_color_redirection b48ead
# set fish_color_end 88c0d0
# set fish_color_error ebcb8b
# set fish_color_param eceff4
# set fish_color_comment 434c5e
# set fish_color_match --background=brblue
# set fish_color_selection white --bold --background=brblack
# set fish_color_search_match bryellow --background=brblack
# set fish_color_history_current --bold
# set fish_color_operator 00a6b2
# set fish_color_escape 00a6b2
# set fish_color_cwd green
# set fish_color_cwd_root red
# set fish_color_valid_path --underline
# set fish_color_autosuggestion 4c566a
# set fish_color_user brgreen
# set fish_color_host normal
# set fish_color_cancel -r
# set fish_pager_color_completion normal
# set fish_pager_color_description B3A06D yellow
# set fish_pager_color_prefix normal --bold --underline
# set fish_pager_color_progress brwhite --background=cyan

set -g theme_color_scheme nord
set -g theme_nerd_fonts yes
