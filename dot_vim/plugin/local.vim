command! -nargs=* ZettelEdit call zettel#edit(<f-args>)

function! NotesWithPad()
    edit ~/notes/scratchpad.md
    vsp ~/notes/index.md
    winc h
    if (&columns > 140)
      vertical resize 70
    else
      winc =
    endif
    winc l
endfunction
command! -register NotesWithPad call NotesWithPad()

function! VimwikiWithScratchpad()
    edit ~/vimwiki/n-scratchpad.wiki
    vsp ~/vimwiki/index.wiki
    winc h
    if (&columns > 140)
      vertical resize 70
    else
      winc =
    endif
    winc l
endfunction
command! -register VimwikiWithScratchpad call VimwikiWithScratchpad()

function! SnippetConfig()
    let l:ultisnips_dir = "~/.local/share/nvim/plugged/vim-snippets/UltiSnips"
    let l:personal_snippets_dir = "~/.config/nvim/UltiSnips"

    execute "edit " . fnameescape(l:ultisnips_dir)
    execute "lcd " . fnameescape(l:ultisnips_dir)

    execute "vsp " . fnameescape(l:personal_snippets_dir)
    execute "lcd " . fnameescape(l:personal_snippets_dir)

    winc =
endfunction
command! -register SnippetConfig call SnippetConfig()
