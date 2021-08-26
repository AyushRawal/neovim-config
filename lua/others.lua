-- icons
require("nvim-web-devicons").setup({
	override = {
		zsh = {
			icon = "",
			color = "#FFF",
			name = "Zsh",
		},
	},
	default = true,
})

-- colorizer
require("colorizer").setup({
	"css",
	"html",
	"javascript",
	"vim",
	"lua",
}, {
	RRGGBBAA = true,
	css = true,
})

-- indent blankline config
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_space_char = "·"
