let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})

" competitive programming mappings
nnoremap <buffer> <F5> :!runcpp %<CR>
nnoremap <buffer> <F4> :!clip > input.txt<CR><CR>
nnoremap <buffer> <F6> :!runcpp clean<CR><CR>

