func! zettel#edit(...)
    let l:sep = ''
    if len(a:000) > 0
        let l:sep = '-'
    endif
    let l:fname = expand('~/notes/') . strftime("%F-%H%M") . l:sep . join(a:000, '-') . '.md'

    exec "e " . l:fname

    if len(a:000) > 0
        exec "normal ggO# \<c-r>=strftime('%Y-%m-%d %H:%M')\<cr> " . join(a:000) . "\<cr>\<esc>"
        :startinsert
    else
        exec "normal ggO# \<c-r>=strftime('%Y-%m-%d %H:%M')\<cr> \<esc>"
        :startinsert!
    endif
endfunc
