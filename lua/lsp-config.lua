local nvim_lsp = require("lspconfig")
local data_path = vim.fn.stdpath("data")

vim.fn.sign_define(
  "LspDiagnosticsSignError",
  { text = "", texthl = "LspDiagnosticsSignError", numhl = "LspDiagnosticsSignError" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  { text = "", texthl = "LspDiagnosticsSignWarning", numhl = "LspDiagnosticsSignWarning" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  { text = "", texthl = "LspDiagnosticsSignInformation", numhl = "LspDiagnosticsSignInformation" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  { text = "", texthl = "LspDiagnosticsSignHint", numhl = "LspDiagnosticsSignHint" }
)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Mappings.
  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", "<leader>lwl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<leader>ld", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "<M-[>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "<M-]>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  buf_set_keymap("n", "gq", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("v", "gq", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_command([[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.api.nvim_command([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.api.nvim_command([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
  end
  -- auto format on save
  -- vim.api.nvim_command("autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

nvim_lsp.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    data_path .. "/lspinstall/cpp/clangd/bin/clangd",
    "--background-index",
    "--fallback-style=Microsoft",
  },
})

nvim_lsp.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    data_path .. "/lspinstall/python/node_modules/.bin/pyright-langserver",
    "--stdio",
  },
  settings = { python = { analysis = { typeCheckingMode = "off" } } },
})

nvim_lsp.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    data_path .. "/lspinstall/go/gopls",
  },
})

local prettier = { formatCommand = "prettierd '${INPUT}'", formatStdin = true }
local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename '${INPUT}'",
  lintStdin = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true,
}

nvim_lsp.efm.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    documentFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true,
  },
  filetypes = {
    "lua",
    "python",
    "html",
    "css",
    "scss",
    "less",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "markdown",
  },
  cmd = {
    data_path .. "/lspinstall/efm/efm-langserver",
  },
  settings = {
    languages = {
      lua = {
        { formatCommand = "stylua  --indent-type spaces --indent-width 2 - ", formatStdin = true },
      },
      python = {
        { formatCommand = "black - ", formatStdin = true },
      },
      html = { prettier },
      css = { prettier },
      less = { prettier },
      scss = { prettier },
      javascript = { eslint },
      javascriptreact = { eslint },
      typescript = { eslint },
      typescriptreact = { eslint },
      json = { prettier },
      markdown = { prettier },
    },
  },
})

nvim_lsp.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "node",
    data_path .. "/lspinstall/html/vscode-html/html-language-features/server/dist/node/htmlServerMain.js",
    "--stdio",
  },
})
nvim_lsp.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "node",
    data_path .. "/lspinstall/css/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
    "--stdio",
  },
})
nvim_lsp.jsonls.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end,
  capabilities = capabilities,
  cmd = {
    "node",
    data_path .. "/lspinstall/json/vscode-json/json-language-features/server/dist/node/jsonServerMain.js",
    "--stdio",
  },
})
nvim_lsp.tsserver.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
  end,
  capabilities = capabilities,
  init_options = {
    hostInfo = "neovim",
  },
  cmd = {
    data_path .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
    "--stdio",
  },
})

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
  cmd = {
    data_path .. "/lspinstall/lua/sumneko-lua-language-server",
    "-E",
    data_path .. "/lspinstall/lua/main.lua",
  },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
