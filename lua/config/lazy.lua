-- lazy.lua
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up leader keys (this should be done before loading lazy.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim and load plugins from the "plugins" folder
require("lazy").setup({
  spec = {
    -- Import the plugin files from the "plugins" folder
    { import = "plugins" },
  },
  -- Automatically check for plugin updates
  checker = { enabled = true },
  -- Colorscheme setup (if you want to install it during plugin setup)
  install = { colorscheme = { "habamax" } },
})
