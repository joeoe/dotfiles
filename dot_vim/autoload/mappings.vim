" Cycle through relativenumber + number, number (only), and no numbering.
function! mappings#cycle_numbering() abort
  if exists('+relativenumber')
    execute {
          \ '00': 'set relativenumber   | set number',
          \ '01': 'set norelativenumber | set number',
          \ '10': 'set norelativenumber | set nonumber',
          \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!<CR>
  endif
endfunction

" Zap trailing whitespace.
function! mappings#zap() abort
  let l:pos=getcurpos()
  let l:search=@/
  keepjumps %substitute/\s\+$//e
  let @/=l:search
  nohlsearch
  call setpos('.', l:pos)
endfunction

" Convert vimwiki files to markdown
function! mappings#wiki2md() abort
    " headings
    %s/^===/###/e
    %s/^==/##/e
    %s/^=/#/e
    %s/\s*=\+$//e

    " [[<url>|<description>]] -> [<description>](<url>)
    %s/\[\[\(.*\)|\(.*\)\]\]/[\2](\1)/e
endfunction


