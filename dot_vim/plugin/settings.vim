" COLORS
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

if system('sun-up') == 'Daylight'
    set background=light
    colorscheme PaperColor
else
    set background=dark
    colorscheme one
endif

set omnifunc=syntaxcomplete#Complete
set ignorecase
set smartcase
set showmatch
set hlsearch
set noeb vb t_vb=
set belloff=all

set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

set diffopt=internal,filler,indent-heuristic,algorithm:patience
set shortmess=filmnwxtToOIF
set modelines=1
set encoding=utf-8
set laststatus=2
set backspace=2
set scrolloff=6
set lazyredraw
set autowrite
set splitbelow
set splitright
set formatoptions+=j
set hidden
set title
set number
set relativenumber
set showcmd
set cursorline

set dir=$HOME/.vim/swapfiles//

let g:netrw_sort_options = 'i'
let g:netrw_banner = 0
let g:netrw_fastbrowse = 0
let g:netrw_liststyle = 1

"return to last edit point when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal!`\"" |
    \ endif

if has('folding')
    if (has('windows'))
        set fillchars=vert:┃              " BOX DRAWINGS HEAVY VERTICAL (U+2503, UTF-8: E2 94 83)
    endif
    set foldmethod=indent               " not as cool as syntax, but faster
    set foldlevelstart=99               " start unfolded
endif

" vim:fdm=marker
