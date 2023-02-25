local null_ls = require 'null-ls'

local code_actions = null_ls.builtins.code_actions
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

null_ls.setup {
  sources = {
    --formatting.stylua,

    --diagnostics.eslint,
    --formatting.eslint,
    code_actions.eslint,

    formatting.prettierd,
  },
  on_attach = function(client, bufnr)
    -- Makes sure to format on save
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
