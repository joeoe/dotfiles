let mapleader = "\<Space>"
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>Q :quit!<CR>
nnoremap <Leader>x :exit<CR>
nnoremap <Leader>/ :noh<CR>

map <Leader>bd :BD<CR>
map <Leader>bw :BW<CR>
map <Leader>bu :BUN<CR>
map <Leader><Leader> :BA<CR>

" gc in colemak is way too uncomfortable
xmap <Leader>c <Plug>Commentary
nmap <Leader>c <Plug>Commentary
omap <Leader>c <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine

" open last viewed buffer (bufkill offers better impl)
" nnoremap <Leader><Leader> <C-^>

" personal preference
nnoremap Q q
nnoremap K <nop>
nnoremap Y y$
nnoremap 0 ^
" nnoremap / /\v
" vnoremap / /\v

" Resize wth arrow keys
nnoremap <silent> <Left> :vertical resize -1<CR>
nnoremap <silent> <Right> :vertical resize +1<CR>
nnoremap <silent> <Up> :resize +1<CR>
nnoremap <silent> <Down> :resize -1<CR>

" Center when moving about
noremap n nzz
noremap N Nzz
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Repeat last macro use
nnoremap <silent><expr> <CR> empty(&buftype) ? '@@' : '<CR>'

" Whitespace removal
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" Common file use
nnoremap <F8> :vsp $MYVIMRC<CR>:lcd %:p:h<CR>:pwd<CR>
nnoremap <F9> :e $MYVIMRC<CR>:lcd %:p:h<CR>:pwd<CR>
nnoremap <F7> :source $MYVIMRC<CR>
nnoremap <F3> :cd %:p:h<CR>:pwd<CR>
nnoremap <F2> :lcd %:p:h<CR>:pwd<CR>

" Zap trailing whitespace in the current buffer.
nnoremap <silent> <Leader>Z :call mappings#zap()<CR>

" Create new zettel
nnoremap <silent> <Leader>z :ZettelEdit 

" Edit file, starting in same directory as current file.
nnoremap <Leader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

" PLUGINS
" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

""" FZF
nnoremap <C-p>      :Files<CR>
nnoremap <leader>f  :Rgee<CR>
nnoremap <leader>;  :Commands<CR>
nnoremap <leader>ls :Buffers<CR>
nnoremap <leader>t  :BTags<CR>
nnoremap <leader>T  :Tags<CR>
nnoremap <leader>m  :Marks<CR>
nnoremap <leader>h  :History<CR>
nnoremap <leader>g  :BCommits<CR>
nnoremap <leader>G  :Commits<CR>
" NV
nnoremap <leader>n  :NV<CR>
nnoremap <leader>N  :NV!<CR>

""" Tmux-Navigator
let g:tmux_navigator_no_mappings = 0
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<CR>
" let g:tmux_navigator_disable_when_zoomed = 1

if exists(':Tabularize')
    nmap <leader>a= :Tabularize /=\zs/l0c1l0<CR>
    vmap <leader>a= :Tabularize /=\zs/l0c1l0<CR>
endif

" expands
iab <expr> dts strftime('%y-%m-%d')

" vim:fdm=marker
