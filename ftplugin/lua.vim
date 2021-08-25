setlocal tabstop=2
setlocal shiftwidth=2

function! Format()
	let view = winsaveview()
	execute "%!stylua --indent-type Spaces --indent-width 2 - "
	if v:shell_error
		% |
		undo
		echohl Error | echomsg "stylua returned an error" | echohl None
	endif
	call winrestview(view)
endfunction

command! -buffer Fmt call Format()

