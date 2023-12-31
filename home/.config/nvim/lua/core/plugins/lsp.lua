local opts = { noremap=true, silent=true }

vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

local function on_attach()
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set("n", 'gD', vim.lsp.buf.declaration, { buffer = 0 })
  vim.keymap.set('n', 'gi',  vim.lsp.buf.implementation, { buffer = 0 })
  vim.keymap.set('n', 'gw',  vim.lsp.buf.document_symbol, { buffer = 0 })
  vim.keymap.set('n', 'gw',  vim.lsp.buf.workspace_symbol, { buffer = 0 })
  vim.keymap.set('n', 'gr',  vim.lsp.buf.references, { buffer = 0 })
  vim.keymap.set('n', 'gt',  vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { buffer = 0 })
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { buffer = 0 })
end

local servers = { "bashls", "lua_ls", "cssls", "gopls", "tsserver", "html", "jsonls"  }



return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      for _, server in pairs(servers) do
        require("lspconfig")[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end

      require("lspconfig").lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = false
        }
      )
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {}
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = servers
    }
  }
}
