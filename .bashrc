# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
   . ~/.bash_aliases
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
elif [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
elif [ -f /opt/local/etc/bash_completion ]; then
   . /opt/local/etc/bash_completion
fi

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTTIMEFORMAT="%F-%T%t"
shopt -s histappend

# ruby utils
export PATH=/usr/local/Cellar/ruby/1.9.2-p180/bin:$PATH
# system utils
export PATH=/opt/local/bin:/usr/local/bin:/sbin:/usr/sbin:$PATH
# home directory utils
export PATH=$HOME/bin:$HOME/local/bin:$HOME/.awk:$PATH
#export CDPATH=.:$HOME/Documents/projects
#export MANPATH=/opt/local/share/man:$MANPATH
#export PYTHONPATH=$HOME/Documents/projects/python/site-packages
#export JAVA_HOME=/usr/lib/jvm/current/jre/bin/
#export PLUGIN_HOME=/usr/lib/jvm/current/jre/plugin/
#export REPO=http://subversion/repos
#export SVN_SSH='ssh -o ControlMaster=no'
#export DJANGO_SETTINGS_MODULE=ajcsite.settings_local
#export LSCOLORS=ExFxCxDxBxEgEdAbAgAcAd
export PAGER='less -Rie'
export LESS='-Rie'
#export RI='--format ansi --width 100'

export EDITOR=vim
export GREP_OPTIONS="--color=auto"
if [ "1" == "$(python -c "from distutils.version import *;print int(LooseVersion('$(grep -q --version|sed 's/[^0-9.]*//g;1p;d')')>=LooseVersion('2.5.3'))")" ]; then
   export GREP_OPTIONS="$GREP_OPTIONS --exclude-dir=.svn --exclude-dir=.git"
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# Use TMUX
[[ -n "$PS1" && -z "$TMUX" ]] && { tmux attach || tmux; }

# set a fancy prompt (non-color, unless we know we "want" color)
if [[ $TERM =~ xterm-.*color || $TERM =~ screen.* ]]; then
   echo '[[ $TERM =~ xterm-.*color || $TERM =~ screen.* ]] So, use fancy prompt'
#   colorps1
   #if [[ $TERM =~ screen.* ]]; then
   export SCREEN_CMD=$(which screen 2>/dev/null)
   #if [[ ( $TERM =~ screen.* ) || ${SCREEN_CMD-X} != X && ${SCREEN_CMD-X} != "" ]]; then
   if [[ ${SCREEN_CMD-X} != X && ${SCREEN_CMD-X} != "" ]]; then
      echo '[[ ${SCREEN_CMD-X} != X && ${SCREEN_CMD-X} != "" ]] So, no need to launch screen'
      # This is the escape sequence ESC k \w ESC \
      #Use path as title
      #SCREENTITLE='\[\ek\w\e\\\]'
      #Use program name as title
#      SCREENTITLE='\[\ek\e\\\]'
      true
   else
      echo "NOT: [[ ${SCREEN_CMD-X} != X && ${SCREEN_CMD-X} != '' ]] So, we need to launch screen"
      #Soliton@freenode#screen suggested screen -xRRS primary
#      echo k$(hostname|sed "s/\..*//")\\
      export SCREEN_CMD=$(which screen 2>/dev/null)
      if [[ ${SCREEN_CMD-X} != X && ${SCREEN_CMD-X} != "" ]]; then
         echo "[[ ${SCREEN_CMD-X} != X && ${SCREEN_CMD-X} != "" ]]"
         screen -xRRS primary && unset SCREEN_CMD && [[ $(stat -c %Y .screen_do_not_disconnect 2>/dev/null || stat -f %m .screen_do_not_disconnect 2>/dev/null) -gt 0 ]] || exit
      fi
   fi
else
   echo "NOT: [[ $TERM =~ xterm-.*color || $TERM =~ screen.* ]]"
#   colorps1
#   SCREENTITLE=''
   #Soliton@freenode#screen suggested screen -xRRS primary
#   echo k$(hostname|sed "s/\..*//")\\
   export SCREEN_CMD=$(which screen 2>/dev/null)
   if [[ ${SCREEN_CMD-X} != X ]]; then
      echo "[[ ${SCREEN_CMD-X} != X ]]"
      screen -xRRS primary && unset SCREEN_CMD && [[ $(stat -c %Y .screen_do_not_disconnect 2>/dev/null || stat -f %m .screen_do_not_disconnect 2>/dev/null) -gt 0 ]] || exit
   fi
fi
#PS1="${SCREENTITLE}${PS1}"
export PS1='======= \t (\!) \u@\H:$PWD  [$OLDPWD] ======\n\$ '

if [ -f ~/.gnupg/.gpg_agent-info ]; then
   source ~/.gnupg/.gpg_agent-info
fi

if [ -f ~/.bash_private.gpg ]; then
   eval "$(gpg --decrypt ~/.bash_private.gpg 2>/dev/null)"
fi

# ^p check for partial match in history
bind -m vi-insert "\C-p":dynamic-complete-history
# ^n cycle through the list of partial matches
bind -m vi-insert "\C-n":menu-complete
# ^l clear screen
bind -m vi-insert "\C-l":clear-screen

set -o vi

export WORKON_HOME=$HOME/ve
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
source $(which virtualenvwrapper.sh)

# vi:ts=3:sw=3:et:tw=0
