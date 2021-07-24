syntax enable
set number 
set encoding=utf-8
set hidden
set showmatch
set ignorecase
set smartcase
set incsearch
set autoindent
set ruler
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set wrap
set hlsearch
set cursorline
set mouse=a
filetype plugin indent on
set splitbelow splitright
set scrolloff=999
set shortmess-=Fi
set clipboard=unnamedplus
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let mapleader= ";"

" move visually
nnoremap j gj
nnoremap k gk

" fast movement
nnoremap <S-up> 10k
nnoremap <S-down> 10j
nnoremap J 10j
nnoremap K 10k

" move among splits
inoremap <C-h> <C-\><C-N><C-w>h 
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" splits
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
	Plug 'easymotion/vim-easymotion'
	Plug 'hoob3rt/lualine.nvim'
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

runtime resize.vim

" resize splits
nnoremap <silent> <A-H> :CmdResizeLeft<cr>
nnoremap <silent> <A-J> :CmdResizeDown<cr>
nnoremap <silent> <A-K> :CmdResizeUp<cr>
nnoremap <silent> <A-L> :CmdResizeRight<cr>

lua << EOF
require("lsp-config")
require("compe-config")
require("nvim-treesitter.configs").setup {
	ensure_installed = "maintained",
	highlight = {enable = true},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000,
		colors = {
			"#4bb4d1",
			"#8d42f5",
			"#ad14c4"
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
EOF

" compe mappings
" inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
" inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" ----------------------
" terminal config
function! OpenTerminal()
	split +term
	resize 20
endfunction

nnoremap <leader>t :call OpenTerminal()<CR>

" escape terminal mode
tnoremap <Esc> <C-\><C-n>

" move among splits in terminal mode
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" start terminal in inert mode
autocmd TermOpen * startinsert

" enable wrap in terminal
au TermOpen * setlocal wrap 

" cycle through buffes
nnoremap <silent> <A-b> :BufferNext<CR>
nnoremap <silent> <A-B> :BufferPrevious<CR>
nnoremap <silent> <leader>x :BufferClose<CR>

let bufferline = get(g:, 'bufferline', {})
let bufferline.icon_close_tab = '×'

" -----------------------
" Nvim Tree config
let g:nvim_tree_auto_close = 1
let g:nvim_tree_auto_open = 1
let g:nvim_tree_lsp_diagnostics = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_follow = 1
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
nnoremap <silent><leader>b :NvimTreeToggle<CR>

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
	{ key = "z",                        cb = tree_cb("full_rename") },
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

" --------------------------
" NerdCommenter Config

let g:NERDSpaceDelims = 1
map <leader>/ <plug>NERDCommenterToggle

" --------------------------

let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "vim-plug", "NvimTree" ]
let g:tokyonight_italic_keywords = 0

if (has("termguicolors"))
	set termguicolors
endif
colorscheme tokyonight

" auto format cpp files on save
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)

