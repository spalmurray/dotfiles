#
# ~/.bashrc
#

# macos stuff
export PATH="/opt/homebrew/bin:$PATH"
alias python='python3'
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
export BASH_SILENCE_DEPRECATION_WARNING=1
export SHELL="/opt/homebrew/bin/bash"

# Bash history config
export HISTSIZE=
export HISTFILESIZE=

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\e[31m\]\u\]\e[37m\]@\e[33m\]work\e[37m\]:\e[32m\]\w \e[37m\]\n\\$ "

# GPG
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye > /dev/null
export HOME=/Users/spencer

# Aliases
alias vim=nvim
alias c=clear
alias t='tmux attach || tmux'
alias ls='ls --color=auto'

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -S -m'
alias gp='git pull'
alias gpu='git push'
alias gpuo='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gu='CURRENT_GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD) && git checkout main && git pull && git checkout $CURRENT_GIT_BRANCH && git merge main'

# Exports
export PATH=$PATH:~/bin/
export PATH=$PATH:"$HOME.local/bin"
export SUDO_EDITOR=vim
export EDITOR=vim
export XDG_CONFIG_HOME="$HOME/.config"

# Use vim binds
set -o vi

# enable globstar
shopt -s globstar

# zoxide init
eval "$(zoxide init bash)"

export FZF_DEFAULT_COMMAND='find ~'
export FZF_DEFAULT_OPTS='--border'

