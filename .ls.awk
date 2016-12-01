# inpsired by http://superuser.com/questions/448291/how-can-i-make-ls-show-dotfiles-first

{
    if($1 == "total"){
        print $0
        next
    }
    # may need to adjust $9 to match your name column
    if(match($9, /^(\033\[[0-9]*m)*\./)) # optionally look past xterm highlighting like: ^[[34m
        df[++dd] = $0
    else
        nf[++nn] = $0
}
END{
    while (++d in df)
        print df[d]
    while (++n in nf)
        print nf[n]
}
