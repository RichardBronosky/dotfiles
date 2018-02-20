cat >> ~/.bashrc << EOF

for f in .bash_aliases .bashrc.env.ext .bashrc.man.ext .bashrc.hist.ext .bashrc.tmux.ext; do
    if [ -f $(cd "$(dirname "$BASH_SOURCE")"; pwd)/\$f ]; then
		source $(cd "$(dirname "$BASH_SOURCE")"; pwd)/\$f
    fi
done

EOF

mkdir ~/.vim
ln -s $(cd "$(dirname "$BASH_SOURCE")"; pwd)/.vim/vimrc.basic ~/.vim/
