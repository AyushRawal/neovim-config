local function get_lsp()
  local clients = vim.lsp.buf_get_clients()
  local lsp_string = ""
  if next(clients) ~= nil then
    for _, client in ipairs(clients) do
      lsp_string = " " .. lsp_string .. client.name
    end
    return "LSP: " .. lsp_string
  else
    return ""
  end
end

require("lualine").setup({
  options = {
    -- theme = 'tokyonight',
    theme = "gruvbox_material",
    section_separators = { "", "" },
    component_separators = { "", "" },
  },
  extensions = { "quickfix", "nvim-tree", "fzf" },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        "branch",
        separator = "  ",
      },
      {
        "diff",
        color_added = "#6ABD6A",
        color_modified = "#BA8868",
        color_removed = "#FA7686",
      },
    },
    lualine_c = {
      {
        "filename",
        path = 1,
      },
      {
        get_lsp,
        color = "lualine_b_normal",
      },
      {
        require("nvim-treesitter").statusline,
        icon = " ﬦ ",
      }
    },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        symbols = {
          error = "  ",
          warn = " 𥉉 ",
          info = "  ",
          hint = "  ",
        },
        separator = " ❚ ",
        color_error = "#DF6262",
        color_warn = "#AABA20",
        color_info = "#DDAAAA",
        color_hint = "#5ABA34",
      },
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
})
