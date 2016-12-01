# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export PATH=$HOME/bin:$PATH

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTTIMEFORMAT="%F-%T%t"
shopt -s histappend

export PAGER='less -Rie'
export LESS='-Rie'
export EDITOR=vim
export GREP_OPTIONS="--color=auto"

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Use TMUX
#[[ -n "$PS1" && -z "$TMUX" ]] && { tmux attach || tmux; }

if [ -f ~/.bash_private.gpg ]; then
	eval "$(gpg --decrypt ~/.bash_private.gpg 2>/dev/null)"
fi

set -o vi

# vi:ts=4:sw=4:et:tw=0
alias dotfiles='/usr/bin/git --git-dir=/Users/bbronosky/.dotfiles/ --work-tree=/Users/bbronosky'
