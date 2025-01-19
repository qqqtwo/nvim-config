-- snippets.lua
return {
  -- LuaSnip for snippets
  { 'L3MON4D3/LuaSnip' },

  -- Define or load custom snippets
  {
    'L3MON4D3/LuaSnip',
    config = function()
      local luasnip = require('luasnip')

      -- Example snippet (you can define more snippets for different languages)
      luasnip.add_snippets('lua', {
        luasnip.parser.parse_snippet("trigger", "print('${1:Hello, World!}')")
      })

      -- Keybinding to expand or jump in snippets
      vim.api.nvim_set_keymap('i', '<C-j>', '<Cmd>lua require"luasnip".expand_or_jump()<CR>', { noremap = true, silent = true })
    end,
  },
}
