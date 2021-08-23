syntax enable
set number 
set relativenumber
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
set nowrap
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set splitbelow splitright
set scrolloff=999
set shortmess-=Fi
set clipboard=unnamedplus
filetype plugin indent on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" PLugins
call plug#begin("/home/rawal/.config/nvim/plugged")
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/vim-vsnip'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'hrsh7th/nvim-compe'
Plug 'rafamadriz/friendly-snippets', {'branch' : 'main'}
Plug 'kabouzeid/nvim-lspinstall', {'branch' : 'main'}
Plug 'tpope/vim-surround'
Plug 'romgrk/barbar.nvim'
Plug 'ap/vim-css-color'
Plug 'p00f/nvim-ts-rainbow'
Plug 'phaazon/hop.nvim'
Plug 'junegunn/fzf.vim'
Plug 'hoob3rt/lualine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

runtime resize.vim
runtime fzf.vim

lua << EOF
require("lsp-config")
require("compe-config")
EOF

let mapleader= ";"

" fast movement
nnoremap <S-up> 10k
nnoremap <S-down> 10j
nnoremap J 10j
nnoremap K 10k

" join lines
nnoremap M mzJ`z

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

" cycle quickfix list
nnoremap <A-}> :cnext<CR>
nnoremap <A-{> :cprev<CR>

" make life easier 
nnoremap 0 ^
nnoremap ^ 0

"save me
command! W :w
command! Wq :wq
command! Q :q
command! -bang Q :q<bang>

" clear highlights 
nnoremap <leader>l :noh<CR>

" resize splits
nnoremap <silent> <A-H> :CmdResizeLeft<cr>
nnoremap <silent> <A-J> :CmdResizeDown<cr>
nnoremap <silent> <A-K> :CmdResizeUp<cr>
nnoremap <silent> <A-L> :CmdResizeRight<cr>

"fzf config
let g:fzf_action = {
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'}
" Customize fzf colors to match your color scheme
let g:fzf_colors = {
    \ 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Comment'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }
let $FZF_DEFAULT_COMMAND = 'rg --hidden --files --follow -g "!\.git/"'
nnoremap <leader>f :Files<CR>
" Get text in files with Rg
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <leader>F :Rg<CR>
nnoremap <C-f> :Blines<Cr>
nnoremap <leader>h :History<CR>
nnoremap <leader>gc :Commits<CR>
nnoremap <leader>gs :GFiles?<CR>

lua << EOF
require("nvim-treesitter.configs").setup {
    highlight = {enable = true},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000,
		colors = {
            "#4aa4d1",
            "#8f62e5",
            "#ad64df",
            "#deaefd",
            "#a4a4fd",
		}
    }
}
require('nvim-web-devicons').setup {
	override = {
		zsh = {
		icon = "",
		color = "#428850",
		name = "Zsh"
		}
	};
 	default = true;
}
require('lualine').setup {
	options = {theme = 'tokyonight'},
	extensions = {'quickfix', 'nvim-tree' }
}
require('hop').setup()
EOF

" hop keybindings
nnoremap <leader><leader>w :HopWord<CR>
nnoremap <leader><leader>j :HopLine<CR>
nnoremap <leader><leader>f :HopChar1<CR>
nnoremap <leader><leader>t :HopChar2<CR>

" auto pairs <C-h> binding disable
let g:AutoPairsMapCh = 0

" compe mappings
" inoremap <silent><expr> <C-e>         compe#complete()
inoremap <silent><expr> <CR>          compe#confirm('<CR>')
inoremap <silent><expr> <C-Space>     compe#close('<C-Space')
" inoremap <silent><expr> <C-f>         compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>         compe#scroll({ 'delta': -4 })

" terminal config
nnoremap <leader>t :term<CR>
" escape terminal mode
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
autocmd TermOpen * startinsert
" enable wrap in terminal
au TermOpen * setlocal wrap 

" cycle through buffes
nnoremap <silent> <A-b> :BufferNext<CR>
nnoremap <silent> <A-B> :BufferPrevious<CR>
nnoremap <silent> <leader>x :BufferClose<CR>
nnoremap <silent> <leader>b :BufferPick<CR>

" barbar config
let bufferline = get(g:, 'bufferline', {})
let bufferline.icon_close_tab = '×'

" indent line config
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_space_char = '.'

" Nvim Tree config
let g:nvim_tree_auto_close = 1
let g:nvim_tree_auto_open = 1
let g:nvim_tree_lsp_diagnostics = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
let g:nvim_tree_disable_default_keybindings = 1
nnoremap <silent><leader>n :NvimTreeToggle<CR>

lua << EOF
local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
    { key = "v",                            cb = tree_cb("vsplit") },
    { key = "s",                            cb = tree_cb("split") },
    { key = "t",                            cb = tree_cb("tabnew") },
    { key = "R",                            cb = tree_cb("refresh") },
    { key = "a",                            cb = tree_cb("create") },
    { key = "d",                            cb = tree_cb("remove") },
    { key = "r",                            cb = tree_cb("rename") },
    { key = "z",                            cb = tree_cb("full_rename") },
    { key = "x",                            cb = tree_cb("cut") },
    { key = "c",                            cb = tree_cb("copy") },
    { key = "p",                            cb = tree_cb("paste") },
    { key = "y",                            cb = tree_cb("copy_name") },
    { key = "Y",                            cb = tree_cb("copy_path") },
    { key = "gy",                           cb = tree_cb("copy_absolute_path") },
    { key = "-",                            cb = tree_cb("dir_up") },
    { key = "q",                            cb = tree_cb("close") },
    { key = "g?",                           cb = tree_cb("toggle_help") },
}
EOF

" NerdCommenter Config
let g:NERDSpaceDelims = 1
let g:NERDCreateDefaultMappings = 0
map <leader>/ <plug>NERDCommenterToggle

" colorscheme
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "vim-plug", "NvimTree" ]
let g:tokyonight_italic_keywords = 0

if (has("termguicolors"))
	set termguicolors
endif
colorscheme tokyonight

