#
# ~/.bashrc
#

# macos stuff
export PATH="/Users/spencer/.cargo/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"
alias python='python3'
export BASH_SILENCE_DEPRECATION_WARNING=1
export SHELL="/opt/homebrew/bin/bash"

# Bash history config
export HISTSIZE=
export HISTFILESIZE=

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\e[31m\]\u\]\e[37m\]@\e[33m\]work\e[37m\]:\e[32m\]\w \e[37m\]\n\\$ "

# GPG
unset SSH_AGENT_PID
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
export HOME=/Users/spencer
alias gpgtty='gpg-connect-agent updatestartuptty /bye > /dev/null'

# Aliases
alias vim=nvim
alias c=clear
alias t='tmux attach || tmux'
alias ls='ls --color=auto'
alias nukedocker='docker system prune -af && docker volume prune -af'

# git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit -S -m'
alias gcob='git checkout -b'
alias gco='git checkout $(git branch -l | fzf)'
alias gcom='git checkout main'
alias gd='git diff'
alias gl='git log'
alias gr='git rebase $(git branch -l | fzf)'
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

# fzf init
export FZF_DEFAULT_COMMAND='find ~'
export FZF_DEFAULT_OPTS='--border'
bind -m emacs-standard '"\C-f": " \C-b\C-k \C-u`__fzf_cd__`\e\C-e\er\C-m\C-y\C-h\e \C-y\ey\C-x\C-x\C-d"'
bind -m vi-command '"\C-f": "\C-z\C-f\C-z"'
bind -m vi-insert '"\C-f": "\C-z\C-f\C-z"'
eval "$(fzf --bash)"

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
