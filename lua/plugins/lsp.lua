-- plugins/lsp.lua
return {
  -- nvim-lspconfig plugin for LSP support
  { 'neovim/nvim-lspconfig' },

  -- Install LSP servers using mason.nvim
  { 'williamboman/mason.nvim', config = function() require('mason').setup() end },
  { 'williamboman/mason-lspconfig.nvim', config = function() 
      require('mason-lspconfig').setup({
        ensure_installed = { "pyright" },  -- This ensures pyright is installed
      })
    end 
  },

  -- Example LSP configuration for Python (pyright)
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.pyright.setup{}  -- Set up pyright LSP server
      -- Add more LSP servers as needed (e.g., tsserver for TypeScript, etc.)
    end,
  },
}
