require("config.lazy")

-- Enable relative line numbers
vim.wo.number = true         -- Show current line number
vim.wo.relativenumber = true -- Show relative line numbers

-- Remove background (use terminal background)
vim.cmd[[highlight Normal guibg=NONE ctermbg=NONE]]
vim.cmd[[highlight NonText guibg=NONE ctermbg=NONE]]

-- Remove the highlight for the status line
vim.cmd[[highlight StatusLine guibg=NONE ctermbg=NONE]]
vim.cmd[[highlight StatusLineNC guibg=NONE ctermbg=NONE]]



-- Keybinds
-- Treesitter
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Custom keybindings for running R code in nvim-R
vim.api.nvim_set_keymap('n', '<leader>r', ':RRun<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rc', ':RConsole<CR>', { noremap = true, silent = true })

-- Transparency settings
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
vim.api.nvim_set_hl(0, "MasonNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "LazyNormal", { bg = "NONE" })
