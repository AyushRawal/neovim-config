vim.g.bufferline = {
	animation = false,
	icon_close_tab = "",
}

vim.api.nvim_set_keymap("n", "<A-b>", ":BufferNext<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<A-B>", ":BufferPrevious<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>x", ":BufferClose<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>b", ":BufferPick<CR>", { silent = true })
