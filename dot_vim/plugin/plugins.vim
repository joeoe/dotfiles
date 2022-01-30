" AIRLINE {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.branch = ''
let g:airline_symbols.maxlinenr = ' '

call airline#parts#define('linenr', { 'raw': '%1l', 'accent': 'bold'})
" call airline#parts#define('maxlinenr', { 'raw': '/%L%', 'accent': 'bold'})
function! AirlineInit()
    let g:airline_section_z = airline#section#create(['obsession', 'linenr', 'maxlinenr', '%2v'])
endfunction
autocmd User AirlineToggledOn call AirlineInit()

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
" }}}
" FZF {{{
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~35%' }

let g:rg_command = '
            \ rg --column --line-number --no-heading --smart-case --color "always"
            \ -g "!{.git,node_modules,vendor,build,package-lock.json,yarn.lock,*.sty,*.bst,*.coffee,dist}/*" '

command! -bang -nargs=* Rgee call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, 
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'), <bang>0)

if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" Customize fzf colors to match your color scheme
let g:fzf_colors = {
            \ 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }


autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
            \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" }}}
" MISC {{{
" Sneak
let g:sneak#use_ic_scs = 1 " case sensitivity as set in vimrc
let g:sneak#label = 1

" Closetags
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,javascript.jsx'

" Colorizer
let g:colorizer_startup = 0

" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#source('_',
            \ 'matchers', ['matcher_full_fuzzy'])

" Ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Vimwiki
let notes = {}
let notes.path = '~/notes'
let notes.syntax = 'markdown'
let notes.ext = '.md'
let notes.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'sh': 'sh'}

let g:vimwiki_list = [notes]
let g:vimwiki_global_ext = 0
let g:vimwiki_table_mappings = 0
let g:vimwiki_hl_headers = 1
" hi VimwikiHeader1 ctermfg=225
" hi VimwikiHeader2 ctermfg=226
" hi VimwikiHeader3 ctermfg=227
" hi VimwikiHeader4 ctermfg=228
" hi VimwikiHeader5 ctermfg=229
" hi VimwikiHeader6 ctermfg=230

let g:notes_directories = ['~/notesbk']

" NV
let g:nv_search_paths = ['~/notes']

"}}}

" vim:fdm=marker:foldlevel=0
