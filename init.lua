-- init.lua
-- Enable true colors support first
vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus"


-- remove ~ on empytlines
vim.opt.fillchars = { eob = " " }

-- remove auto folding
vim.o.foldenable = false
vim.o.foldmethod = 'manual'

-- Load package manager and plugins
require("config.lazy")

-- Clear any existing highlighting
vim.cmd('highlight clear')
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
-- Load and apply colorscheme
require('colors.pastel').setup()

vim.cmd('highlight WinSeparator guifg=#000000 guibg=None')

-- Enable relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})


-- Add to your init.lua or appropriate config file
vim.g.r_syntax_folding = 1
vim.g.rmd_syntax_folding = 1

-- Ensure R syntax is used within Rmd chunks
vim.g.markdown_fenced_languages = {'r'}

-- Keybindings
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<localleader>r', ':RRun<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rc', ':RConsole<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ra', 
  '<Plug>RDSendLine',
  { noremap = false, silent = true }
)

-- Apply transparency settings if desired (after colorscheme)
local transparent_groups = {
    "Normal",
    "NonText",
    "StatusLine",
    "StatusLineNC",
    "NormalFloat",
    "Pmenu",
    "PmenuSel",
    "FloatBorder",
    "MasonNormal",
    "LazyNormal"
}

-- Only apply transparency if you want it
-- Comment out this section if you want to keep the background colors
for _, group in ipairs(transparent_groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
end