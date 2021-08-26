require("hop").setup()

vim.api.nvim_set_keymap("n", "<leader><leader>w", ":HopWord<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>j", ":HopLine<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>f", ":HopChar1<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>t", ":HopChar2<CR>", { silent = true })
