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

export MOZCONFIG=~/repos/home/dotfiles/mozconfig
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
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

#user scripts
export PATH=~/code/bin:$PATH

#rvm
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
	source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
	export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
fi

# my aliases
alias ssh=mosh
alias ls="ls --color"
alias less="less -R"
alias tmux="tmux -2"

# pick up local settings
source ~/.bashrc_local
