vim.g.fzf_action = {
  ["ctrl-s"] = "split",
  ["ctrl-v"] = "vsplit",
}
-- Customize fzf colors to match your color scheme
vim.g.fzf_colors = {
  fg = { "fg", "Normal" },
  bg = { "bg", "Normal" },
  hl = { "fg", "Comment" },
  ["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" },
  ["bg+"] = { "bg", "CursorLine", "CursorColumn" },
  ["hl+"] = { "fg", "Statement" },
  info = { "fg", "PreProc" },
  border = { "fg", "Comment" },
  prompt = { "fg", "Conditional" },
  pointer = { "fg", "Exception" },
  marker = { "fg", "Keyword" },
  spinner = { "fg", "Label" },
  header = { "fg", "Comment" },
}
vim.api.nvim_exec(
[[
let $FZF_DEFAULT_COMMAND = 'rg --hidden --files --follow -g "!\.git/"'
command! -bang -nargs=* Rg :call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
]],
false
)

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ff", ":Files<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fa", ":Rg<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>fb", ":BLines<Cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>h", ":History<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gc", ":Commits<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>gs", ":GFiles?<CR>", opts)
