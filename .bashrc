#
# ~/.bashrc
#

# Bash history config
export HISTSIZE=
export HISTFILESIZE=

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\e[31m\]\u\]\e[37m\]@\e[33m\]\h\e[37m\]:\e[32m\]\w \e[37m\]\n\\$ "

# GPG
export GPG_TTY=$(tty)
export HOME=/home/spencer

# Aliases
alias vim=nvim
alias c=clear
alias lock=swaylock
alias t='tmux attach || tmux -u'
alias ls='ls --color=auto'
alias gpgtty='gpg-connect-agent updatestartuptty /bye >/dev/null'

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -S -m'
alias gcob='git checkout -b'
alias gco='git checkout'
alias gd='git diff'
alias gr='git rebase'
alias gp='gpgtty && git pull'
alias gpu='gpgtty && git push'
alias gpuo='gpgtty && git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gu='CURRENT_GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD) && gpgtty && git checkout main && git pull && git checkout $CURRENT_GIT_BRANCH && git rebase main'
# git autocomplete
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

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

if test -z "${XDG_RUNTIME_DIR}"; then
    export XDG_RUNTIME_DIR=/tmp/spencers-runtime-dir
    if ! test -d "${XDG_RUNTIME_DIR}"; then
        mkdir "${XDG_RUNTIME_DIR}"
        chmod 0700 "${XDG_RUNTIME_DIR}"
    fi
fi

# Use vim binds
set -o vi

# enable globstar
shopt -s globstar

# zoxide init
eval "$(zoxide init bash)"

# fzf init
export FZF_DEFAULT_COMMAND='find ~'
export FZF_DEFAULT_OPTS='--border'
eval "$(fzf --bash)"

# gpg for ssh
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
