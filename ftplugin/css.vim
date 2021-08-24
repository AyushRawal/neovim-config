setlocal tabstop=2
setlocal shiftwidth=2

function! Format()
	let view = winsaveview()
	execute "%!prettier --stdin-filepath '" . expand('%:p') . "'"
	if v:shell_error
		% |
		undo
		echohl Error | echomsg "prettier returned an error" | echohl None
	endif
	call winrestview(view)
endfunction

command! -buffer Fmt call Format()

