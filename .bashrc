#
# ~/.bashrc
#

# Bash history config
export HISTSIZE=100000
export HISTFILESIZE=1000000

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\e[31m\]\u\]\e[37m\]@\e[33m\]\h\e[37m\]:\e[32m\]\w \e[37m\]\n\\$ "

# GPG
export GPG_TTY=$(tty)
export HOME=/home/spencer

# Aliases
alias vim=nvim
alias c=clear
alias t='tmux attach || tmux'
alias ls='ls --color=auto'
alias code="codium --enable-proposed-api GitHub.copilot --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias gits='git status'
alias gita='git add'
alias gitc='git commit -m'
alias gitp='git push'

# Exports
export PATH=$PATH:~/bin/
export PATH=$PATH:/home/spencer/.local/bin
export SUDO_EDITOR=vim
export EDITOR=vim
export PICO_SDK_PATH=/home/spencer/Documents/projects/pico/pico-sdk
export BROWSER=/usr/bin/librewolf
export XDG_CONFIG_HOME=/home/spencer/.config

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Ruby gems stuff
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# Use vim binds
set -o vi

# enable globstar
shopt -s globstar

# zoxide init
eval "$(zoxide init bash)"

