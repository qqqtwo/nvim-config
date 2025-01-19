-- completion.lua
return {
  -- nvim-cmp for completion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },   -- LSP source for nvim-cmp
  { 'hrsh7th/cmp-buffer' },     -- Buffer source for nvim-cmp
  { 'hrsh7th/cmp-path' },       -- Path source for nvim-cmp
  { 'hrsh7th/cmp-cmdline' },    -- Cmdline source for nvim-cmp

  -- Snippet engine and LuaSnip for snippets
  { 'L3MON4D3/LuaSnip' },       -- Snippet engine
  { 'saadparwaiz1/cmp_luasnip' },  -- Snippet source for nvim-cmp

  -- Configuration for nvim-cmp
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)  -- Use LuaSnip for expanding snippets
          end,
        },
        mapping = {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
        },
      })
    end,
  },
}
