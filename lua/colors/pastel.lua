-- colors/pastel.lua
local M = {}
M.colors = {
    -- Base colors
    bg = "#1a1b26",         -- Deep dark background
    fg = "#ff79c6",         -- Bright pink as default text
    red = "#ff5555",        -- Bright red
    green = "#50fa7b",      -- Bright neon green
    blue = "#00bfff",       -- Deep sky blue
    yellow = "#f1fa8c",     -- Soft yellow
    magenta = "#ff00ff",    -- Bright magenta
    cyan = "#00ffff",       -- Bright cyan
    orange = "#ffb86c",     -- Bright orange
    pink = "#ff79c6",       -- Bright pink
    purple = "#bd93f9",     -- Bright purple
}

function M.setup()
    vim.opt.termguicolors = true
    vim.opt.background = 'dark'
    
    vim.cmd("highlight clear")
    if vim.fn.exists("syntax_on") then
        vim.cmd("syntax reset")
    end
    
    vim.g.colors_name = "pastel"
    local colors = M.colors
    
    local highlights = {
        -- Base highlights

        IblIndent = { fg = colors.blue, nocombine = true },  -- Add nocombine to prevent other highlights from overriding
        Normal = { fg = colors.pink, bg = colors.bg },
        Comment = { fg = colors.blue, italic = true },
        Keyword = { fg = colors.purple, bold = true },
        Function = { fg = colors.green, bold = true },
        String = { fg = colors.cyan },
        Number = { fg = colors.orange },
        ["@variable"] = { fg = colors.pink },           -- Modern treesitter variable highlight
--        ["@variable.builtin"] = { fg = colors.pink },   -- Built-in variables (self, etc)
--        ["@parameter"] = { fg = colors.pink },          -- Function parameters
--        Variable = { fg = colors.pink },                -- General variable highlight
--        Identifier = { fg = colors.pink },              -- General identifiers
        -- Python specific highlights

        -- R-specific highlights
        rOperator = { fg = colors.purple },
        rFunction = { fg = colors.green, bold = true },
        rType = { fg = colors.magenta },
        rString = { fg = colors.cyan },
        rComment = { fg = colors.blue, italic = true },
        
        -- Rmd-specific highlights
        markdownHeading = { fg = colors.magenta, bold = true },
        markdownCode = { fg = colors.green },
        markdownCodeBlock = { fg = colors.green },
        markdownH1 = { fg = colors.magenta, bold = true },
        markdownH2 = { fg = colors.purple, bold = true },
        markdownH3 = { fg = colors.blue, bold = true },
        markdownH4 = { fg = colors.cyan, bold = true },
        markdownH5 = { fg = colors.green, bold = true },
        markdownH6 = { fg = colors.orange, bold = true },
        
        -- YAML highlights
        yamlKey = { fg = colors.magenta },
        yamlValue = { fg = colors.green },

        -- Additional syntax highlights
        Identifier = { fg = colors.pink },
        Type = { fg = colors.purple },
        Special = { fg = colors.orange },
        PreProc = { fg = colors.magenta },
        Statement = { fg = colors.purple },
        Constant = { fg = colors.orange },
        Directory = { fg = colors.blue },
        Title = { fg = "#333333", bold = true },
        MatchParen = { fg = colors.orange, bold = true },
        Visual = { bg = "#3d4455" },  -- Slightly lighter than background for selections
        Search = { fg = colors.bg, bg = colors.yellow },
        IncSearch = { fg = colors.bg, bg = colors.orange },
        LineNr = { fg = "#333333" },
        CursorLine = { bg = "#2a2b36" },  -- Slightly lighter than background
        CursorLineNr = { fg = colors.orange, bold = true },
    }
    
    for group, settings in pairs(highlights) do
        local status, err = pcall(vim.api.nvim_set_hl, 0, group, settings)
        if not status then
            print(string.format("Failed to set highlight group %s: %s", group, err))
        end
    end
end

return M