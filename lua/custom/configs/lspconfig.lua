local base = require("nvchad.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

-- clangd
vim.lsp.config("clangd", {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  init_options = {
    fallbackFlags = { "-std=c++23" },
  },
})

-- rust-analyzer
vim.lsp.config("rust_analyzer", {
  capabilities = capabilities,
})

-- basedpyright
vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        typeCheckingMode = "standard",
      },
    },
  },
})

