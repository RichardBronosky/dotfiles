# inpsired by http://superuser.com/questions/448291/how-can-i-make-ls-show-dotfiles-first

function main(){
    if(NF < 9){
		output()
        print $0
    } else
		store()
}

function store(){
    # may need to adjust $9 to match your name column
    if(match($9, /^(\033\[[0-9]*m)*\./)) # optionally look past xterm highlighting like: ^[[34m
        df[++dd] = $0
    else
        nf[++nn] = $0
}

function output(){
    while (++d in df)
        print df[d]
    while (++n in nf)
        print nf[n]
	reset()
}

function reset(){
	split("", df, ":") # empty array
	split("", nf, ":") # empty array
	d=n=dd=nn=0
}

{
	main()
}

END{
	output()
}
