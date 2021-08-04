" auto format cpp files on save
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)

" competitive programming mappings
nnoremap <F5> :!runcpp %<CR>
nnoremap <F4> :!clip > input.txt<CR><CR>
nnoremap <F6> :!runcpp clean<CR><CR>
