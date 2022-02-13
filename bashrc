# /etc/skel/.bashrc:
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

export EDITOR=`which vim`
export PYTHONDONTWRITEBYTECODE=true

# keep a super long bash history
export HISTFILESIZE=250000

# make it easy to have secret commands ;)
export HISTIGNORE=' *'

# set VI editing mode (amazing!)
set -o vi

# store the history immediately
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

if [ -d ~/.kdedevrc ]; then
	source ~/.kdedevrc
fi

# use a red propt for root
if [[ ${EUID} == 0 ]] ; then
	PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
	PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi

# Mac specific stuff
if [[ `uname` == 'Darwin' ]]; then
	source ~/.bashrc_mac
fi

# add correct path for local gems
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# Cabal
export PATH=~/.cabal/bin:$PATH

#user scripts
export PATH=~/bin:$PATH

#rvm
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
	source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
	export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

# Set up GPG Agent using instance launched by X
if [[ -f "${HOME}/.cache/gpg-agent-info" ]]; then
	. "${HOME}/.cache/gpg-agent-info"
	export GPG_AGENT_INFO
	export SSH_AUTH_SOCK
fi

# my aliases
alias ls="ls --color"
alias less="less -R"
alias tmux="tmux -2"
alias nip="npm i; npm prune"
alias ts="tmuxinator start"
alias euall="sudo layman -S && sudo eix-sync && sudo emerge -uavDN world"
alias myemerge="sudo emerge -uavDN world"
alias vss="vim -S Session.vim"
alias be="bundle exec"
alias dc="docker-compose"
alias dsp="docker system prune"

# pick up local settings
source ~/.bashrc_local

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function wof_url {
  node -e 'const id=process.argv[1]; process.stdout.write(`/${id.toString().match(/.{1,3}/g).join("/")}/${id}.geojson`)' "$@"
}
