# beautify ls
export CLICOLOR=1
if [[ "$(uname)" == 'Darwin' ]]; then
	export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"
elif [[ -z $LS_COLORS ]]; then
	export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:"
    alias ls="$(which ls) --color=always"
fi
#export WHICH="$(which gwhich 2>/dev/null || which which 2>/dev/null)"
#alias which='alias | $WHICH --tty-only --read-alias --show-dot --show-tilde'

#alias env='env|sort'
alias _="printf '\n%.0s' {1..10}"
alias cd..='cd ..'
alias ..='cd ..'
alias svim='sudo vim'
alias vmore="vim -u ~/.vimrc.more -"
alias bvim='vim ~/.bashrc ~/.bash_aliases -o'
alias hvim='svim /etc/hosts'
alias gvim="vim -n +'syntax off' +'set nobackup'"
alias lvim="vim +'set noautochdir'"
alias brc='. ~/.bashrc'
alias own='sudo chown -R $(id -nu):$(id -ng)'
alias manu='LESS=-X${LESS} man'
alias dig="url_util dig"
alias host="url_util host"
alias ping="url_util ping"
md() { pandoc -s -f markdown -t man $1 | groff -T utf8 -man | less; } # enables: md README.md

alias py='bpython'
alias jpterm="$(which jpterm); echo;"

# some common uses for grep
alias grephist='history|cgrep -i'
alias grepenv='env|cgrep -i'
alias cgrep='grep --color=force'
alias rgrep='cgrep -rHnE'
alias rhine='rgrep -i'

# git typos
alias gti='git'
alias gt='git'
alias gi='git'

# workflow helpers
alias ussh="ssh -F ~/.ssh/config.ubuntu"
alias essh="ssh -F ~/.ssh/config.ec2-user"

# I guess this is as good a place as any for defining functions
ll(){ CLICOLOR_FORCE=1 ls -lhA $* | awk -f ~/.ls.awk; }

# function for stripping the hostname out of a URL and passing to a utility like ping or dig
url_util(){ $(which $1) $(echo $2 | sed 's?.*//??;s?/.*??'); }
url_util(){ cmd=$(which $1); shift; for a in "$@"; do cmd="$cmd $(echo $1 | sed 's?.*//??;s?[:/].*??')"; shift; done; $cmd; }
alias      dig="url_util dig"
alias nslookup="url_util nslookup"
alias     host="url_util host"
alias     ping="url_util ping"

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

bak(){ cp $1 $1.bak; }
microdate(){ microdate_temp="$(date +'%s.%N')"; echo $microdate_temp; echo $microdate_temp $LASTDATE - p|dc; export LASTDATE=$microdate_temp; }
getrand(){ for n in $(seq ${1:-10}); do echo -n ${RANDOM:1:1}; done }
