syntax enable
set updatetime=500
set number 
set noswapfile
set encoding=utf-8
set hidden
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set ruler
set cursorline
set signcolumn=yes
set nowrap
set autoindent
set smartindent
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set splitbelow splitright
set scrolloff=999
set shortmess-=Fi
set clipboard=unnamedplus
filetype plugin indent on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

if (has("termguicolors"))
    set termguicolors
endif

let mapleader= ";"

" load plugins
lua require('plugins')

" visual movement
nnoremap j gj
nnoremap k gk
nnoremap <up> gk
nnoremap <down> gj

" fast movement
nnoremap <S-up> 10k
nnoremap <S-down> 10j
nnoremap <S-left> 10h
nnoremap <S-right> 10l

" toggle relative numbers
nnoremap <silent><F12> :set rnu!<CR>
" toggle wrap
nnoremap <silent><F10> :setlocal wrap!<CR>

" move among splits
inoremap <C-h> <C-\><C-N><C-w>h 
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" move among splits in terminal mode
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" create splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>

" move block of text
nnoremap <silent> <A-k> :m .-2<CR>==
nnoremap <silent> <A-j> :m .+1<CR>==
inoremap <silent> <A-k> <ESC>:m .-2<CR>==gi
inoremap <silent> <A-j> <ESC>:m .+1<CR>==gi
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv

" Better indenting
vnoremap < <gv
vnoremap > >gv

" better yanking 
nnoremap Y y$
nnoremap <leader>y :%y<CR>

" quickfix list
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <C-q> :call ToggleQuickFix()<CR>
nnoremap <A-.> :cnext<CR>
nnoremap <A-,> :cprev<CR>

" make life easier 
nnoremap 0 ^
nnoremap ^ 0

" save me
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
command! W :w
command! Wq :wq
command! Q :q
command! -bang Q :q<bang>

" edit nvim config on the go
nnoremap <leader>rc :e /home/rawal/.config/nvim/init.vim<CR>
nnoremap <leader><CR> :source /home/rawal/.config/nvim/init.vim<CR>

" clear highlights 
nnoremap <leader>c :noh<CR>

" resize splits
nnoremap <silent> <A-H> :CmdResizeLeft<cr>
nnoremap <silent> <A-J> :CmdResizeDown<cr>
nnoremap <silent> <A-K> :CmdResizeUp<cr>
nnoremap <silent> <A-L> :CmdResizeRight<cr>

" terminal config
nnoremap <leader>tt :term<CR>
nnoremap <leader>tv :60vsplit +term<CR>
nnoremap <leader>ts :20split +term<CR>
" escape terminal mode
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode and enable wrap
autocmd TermOpen * startinsert
autocmd TermOpen * setlocal wrap 
