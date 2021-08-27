return require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim")
    use({
      "terrortylor/nvim-comment",
      as = "nvim_comment",
      config = [[require('nvimcomment')]],
    })
    use({
      "breuckelen/vim-resize",
      opt = true,
      cmd = { "CmdResizeUp", "CmdResizeDown", "CmdResizeLeft", "CmdResizeRight" },
    })
    use({
      "jiangmiao/auto-pairs",
      -- opt = true,
      -- event = "InsertEnter *",
      config = [[require('autopairs')]],
    })
    use({ "kyazdani42/nvim-web-devicons", config = [[require('icons-config')]] })
    use({
      "kyazdani42/nvim-tree.lua",
      opt = true,
      keys = { "n", "<leader>n" },
      config = "require('nvimtree')",
    })
    use({
      "neovim/nvim-lspconfig",
      config = [[require('lsp-config')]],
    })
    use({
      "hrsh7th/nvim-compe",
      opt = true,
      requires = { "jiangmiao/auto-pairs" },
      config = [[require('compe-config')]],
      event = "InsertEnter *",
    })
    use({ "hrsh7th/vim-vsnip", opt = true, event = "InsertEnter *" })
    use({ "rafamadriz/friendly-snippets", opt = true, event = "InsertEnter *" })
    use({ "tpope/vim-surround", opt = true, event = "InsertEnter *" })
    use({ "romgrk/barbar.nvim", config = [[require('bufferline')]] })
    use({
      "norcalli/nvim-colorizer.lua",
      opt = true,
      ft = { "html", "css", "javascript", "vim", "lua" },
      config = [[require('colorizer-config')]],
    })
    use({
      "nvim-treesitter/nvim-treesitter",
      requires = {
        "JoosepAlviste/nvim-ts-context-commentstring",
        "p00f/nvim-ts-rainbow",
      },
      config = [[require('nvimtreesitter')]],
      run = ":TSUpdate",
    })
    use({
      "phaazon/hop.nvim",
      as = "hop",
      config = [[require('hop-config')]],
    })
    use({ "hoob3rt/lualine.nvim", config = [[require('statusline')]] })
    use({ "lukas-reineke/indent-blankline.nvim", config = [[require('indentline-config')]] })
    use({ "sainnhe/gruvbox-material", config = [[require('colorscheme')]] })
    use({
      "junegunn/fzf.vim",
      requires = { "junegunn/fzf" },
      config = [[require('fzf-config')]],
      opt = true,
      keys = {
        { "n", "<leader>ff" },
        { "n", "<leader>fa" },
        { "n", "<leader>fb" },
        { "n", "<leader>h" },
        { "n", "<leader>gc" },
        { "n", "<leader>gs" },
      },
    })
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
