# /etc/skel/.bashrc:
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

EDITOR=`which vim`
export PYTHONDONTWRITEBYTECODE=true

export MOZCONFIG=~/repos/home/dotfiles/mozconfig
if [ -d ~/.kdedevrc ]; then
	source ~/.kdedevrc
fi

PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '

export GOROOT=~/Documents/go/

#rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Mac specific stuff
if [[ `uname` == 'Darwin' ]]; then
	source ~/.bashrc_mac
fi

#user scripts
export PATH=~/code/bin:$PATH

# my aliases
alias ssh=mosh
alias screen=tmux
alias git='hub'

# pick up local settings
source ~/.bashrc_local
