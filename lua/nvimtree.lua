vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_window_picker_exclude = {
  filetype = {
    "packer",
    "qf",
  },
  buftype = {
    "terminal",
  },
}
vim.g.nvim_tree_disable_default_keybindings = 1

local tree_cb = require("nvim-tree.config").nvim_tree_callback
vim.g.nvim_tree_bindings = {
  { key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
  { key = "v", cb = tree_cb("vsplit") },
  { key = "s", cb = tree_cb("split") },
  { key = "t", cb = tree_cb("tabnew") },
  { key = "R", cb = tree_cb("refresh") },
  { key = "a", cb = tree_cb("create") },
  { key = "d", cb = tree_cb("remove") },
  { key = "r", cb = tree_cb("rename") },
  { key = "z", cb = tree_cb("full_rename") },
  { key = "x", cb = tree_cb("cut") },
  { key = "c", cb = tree_cb("copy") },
  { key = "p", cb = tree_cb("paste") },
  { key = "y", cb = tree_cb("copy_name") },
  { key = "Y", cb = tree_cb("copy_path") },
  { key = "gy", cb = tree_cb("copy_absolute_path") },
  { key = "-", cb = tree_cb("dir_up") },
  { key = "q", cb = tree_cb("close") },
  { key = "g?", cb = tree_cb("toggle_help") },
}

require "nvim-tree".setup()

vim.api.nvim_set_keymap("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true })
