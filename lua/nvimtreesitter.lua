require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	-- rainbow brackets
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000,
		-- colors = {
		--   "#4aa4d1",
		--   "#8f62e5",
		--   "#ad64df",
		--   "#deaefd",
		--   "#a4a4fd",
		-- },
	},
	-- senseful commentstring
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			cpp = "// %s",
			c = "// %s",
		},
	},
})
