" auto format cpp files on save
autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 100)

" competitive programming mappings
nnoremap <buffer> <F5> :!runcpp %<CR>
nnoremap <buffer> <F4> :!clip > input.txt<CR><CR>
nnoremap <buffer> <F6> :!runcpp clean<CR><CR>
