local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local latexindent = {
  method = null_ls.methods.FORMATTING,
  filetypes = { "tex" },
  generator = null_ls.formatter({
    command = "latexindent",
    args = { "-g", "/dev/null" },
    to_stdin = true,
  }),
}

local opts = {
  sources = {
    -- C / C++
    null_ls.builtins.formatting.clang_format,
    latexindent,

    -- Web stack: HTML, TSX, JSX, etc.
    null_ls.builtins.formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
        "css",
        "json",
        "yaml",
        "markdown",
      },
    }),

    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.diagnostics.golangci_lint,
  },

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

return opts

