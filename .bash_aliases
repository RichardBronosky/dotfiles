# listing aliases
alias ll='lc -lh'
alias lla='ll -a'
alias la='lc -A'
# Mac specific stuff
if [[ "$(uname)" == 'Darwin' ]]; then
    alias lc='CLICOLOR_FORCE=1 CLICOLOR=1 /bin/ls'
    alias mysql.server='/opt/local/share/mysql/mysql/mysql.server'
else
    alias lc='ls --color=always'
    alias mysql.server='/etc/init.d/mysql'
fi
#export WHICH="$(which gwhich 2>/dev/null || which which 2>/dev/null)"
#alias which='alias | $WHICH --tty-only --read-alias --show-dot --show-tilde'

#alias env='env|sort'
alias cb='cd $OLDPWD'
alias cd..='cd ..'
alias ..='cd ..'
alias svim='sudo vim'
alias vmore="vim -u ~/.vimrc.more -"
alias bvim='vim ~/.bashrc ~/.bash_aliases -o'
alias hvim='svim /etc/hosts'
alias gvim="vim -n +'syntax off' +'set nobackup'"
alias lvim="vim +'set noautochdir'"
alias vim_moonwalk='if [[ -z $f ]]; then read -e -p "file? " f; fn=$(echo ${f} | sed "s/.*\.\([0-9]*\)\.prev/\1/"); f="$(echo $f | sed "s/$fn.prev$/####.prev/")"; fi; n="${fn}"; p="$(echo $((1$n-1))|sed "s/^1//")"; fn="$p"; vimdiff "$(echo $f|sed "s/####/$n/")" "$(echo $f|sed "s/####/$p/")"'
alias brc='. ~/.bashrc'
alias own='sudo chown -R $(id -nu):$(id -ng)'
#alias apt-get='sudo apt-get'
#alias aptitude='sudo aptitude'
#alias apt-key='sudo apt-key'
#alias mysqlbinlog='sudo mysqlbinlog'
#alias mysql_stop='sudo $(which mysql.server|tail -n1) stop'
#alias mysql_start='sudo $(which mysql.server|tail -n1) start'
#alias mysql_restart='sudo $(which mysql.server|tail -n1) restart'
#alias psm='grepps mysql'
alias manu='LESS=-X${LESS} man'
#alias dig="url_util dig"
#alias host="url_util host"
#alias ping="url_util ping"

alias py='bpython'

# some common uses for grep
alias grephist='history|cgrep -i'
alias grepenv='env|cgrep -i'
alias cgrep='grep --color=force'
alias rgrep='cgrep -rHnE'
alias rhine='rgrep -i'
alias rorgrep='rgrep --exclude-dir=vendor --exclude-dir=log'

# git typos
alias git='git'
alias gti='git'
alias gt='git'
alias gi='git'

# I guess this is as good a place as any for defining functions

# function for stripping the hostname out of a URL and passing to a utility like ping or dig
url_util(){ $(which $1) $(echo $2 | sed 's?.*//??;s?/.*??'); }

# Get ip addresses for all network interfaces
ip(){ ifconfig | awk -e '/^[a-z]+/{sub(":","); f=$1} /inet /{print f " " $2}'; }"

function ced () { nd="$(pwd | sed "$@")" && cd "$nd"; }
repos(){ ssh fcp-intradevweb ls $@ /repos/; }
svnurl(){ svn info $@|grep ^URL|sed 's/^[^ ]* //'; }
prompttoggle(){ [[ -z "$PS1_OLD" ]] && export PS1_OLD=$PS1 PS1='\w\$ ' || export PS1=$PS1_OLD PS1_OLD=''; }
grepps(){ ps aux|grep -i "$*" | grep -v "grep -. $*"; }
pst(){ ps -t $(tty|sed 's/^[^p]*//'); }
bak(){ cp $1 $1.bak; }
ts(){ date -d "@$@"; }
microdate(){ microdate_temp="$(date +'%s.%N')"; echo $microdate_temp; echo $microdate_temp $LASTDATE - p|dc; export LASTDATE=$microdate_temp; }
getrand(){ echo $RANDOM$RANDOM$RANDOM$RANDOM|sed 's/.*\(.\{'$1'\}\)$/\1/'; }
#findbetween is not safe for 'last year dates'
#findbetween(){ n=$(date +%j); find . -maxdepth 1 -daystart -mtime $(( -1-$n+$(date --date "$1" +%j))) ! -mtime $(( -$n+$(date --date "$2" +%j)));  }
#verifytar has been moved to a script
#verifytar () { t=$(mktemp); o=$(mktemp); tar ztvf $1 | awk '{print $6,$3}' | sort > $t; shift; ls -la $@ | awk '{print $9,$5}' | sort > $o; if diff $o $t; then echo; echo 'All' $(wc -l $o|awk '{print $1}') 'filenames and sizes match.'; echo; else echo; echo 'Failed comparing filenames and sizes of originals ('$o') and tar contents ('$t').'; echo; fi; }
function colorps1()
{
    word="$(hostname --short)"
    hash="$(echo "$word" | md5sum)"
    fullstr=""
    for l in $(echo $word | sed 's/\(...\)/\1\n/g'); do
        control=""
        endcontrol="$(tput sgr0)"
        case "${hash:0:1}" in
            0)
                control="$(tput bold;tput setaf 0)";;
            1)
                control="$(tput setaf 1)";;
            2)
                control="$(tput setaf 2)";;
            3)
                control="$(tput setaf 3)";;
            4)
                control="$(tput setaf 4)";;
            5)
                control="$(tput setaf 5)";;
            6)
                control="$(tput setaf 6)";;
            7)
                control="$(tput setaf 7)";;
            8)
                control="$(tput bold;tput setaf 0)";;
            9)
                control="$(tput bold;tput setaf 1)";;
            a)
                control="$(tput bold;tput setaf 2)";;
            b)
                control="$(tput bold;tput setaf 3)";;
            c)
                control="$(tput bold;tput setaf 4)";;
            d)
                control="$(tput bold;tput setaf 5)";;
            e)
                control="$(tput bold;tput setaf 6)";;
            f)
                control="$(tput bold;tput setaf 7)";;
        esac
        hash=${hash:1}
        fullstr="$fullstr$control$l"
    done
    export PS1="$(tput bold;[[ $(id -un) == 'root' ]] && tput setaf 1 || tput setaf 2)\\u@$fullstr$endcontrol $(tput bold;tput setaf 4)\W \$ $(tput sgr0)"
}
l () 
{ 
	if ( ! [[ -p "/dev/stdin" ]] ) && [[ -z "$1" ]] || [[ -n "$1" ]] && [[ -d $1 ]]; then
		ls -lah $1;
	else
		less -ie $1;
	fi
}
MYsql()
{
    sudo -H mysql $@
}
MYgrants()
{
    sudo -H mysql -B -N $@ -e "SELECT DISTINCT CONCAT('SHOW GRANTS FOR ''',user,'''@''',host,''';') AS query FROM mysql.user" | tee /tmp/1 | sudo -H mysql $@ | sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/## \1 ##/;/##/{x;p;x;}'
}
mygrants()
{
    mysql -B -N $@ -e "SELECT DISTINCT CONCAT('SHOW GRANTS FOR ''',user,'''@''',host,''';') AS query FROM mysql.user" | mysql $@ | sed 's/\(GRANT .*\)/\1;/;s/^\(Grants for .*\)/## \1 ##/;/##/{x;p;x;}'
}
mycreate(){
    awk '/ON `/{sub("[^`]*`",""); sub("`.*",""); if(!($0 in A)) print "create schema " $0 ";";A[$0]}'
}
myhistory()
{
    sed 's/\\040/ /g' ~/.mysql_history
}

# Mac specific stuff
if [[ "$(uname)" == 'Darwin' ]]; then
    alias top='top -X -L -o cpu'
    alias mktemp='gmktemp -p /tmp/'
fi

