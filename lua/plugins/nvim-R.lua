-- lua/plugins/nvim-r.lua
return {
    "jalvesaq/Nvim-R",
    lazy = true,
    ft = { "r", "rmd", "quarto" },
    config = function()
        -- Basic settings
        vim.g.R_auto_start = 2  -- Don't auto-start R session
        vim.g.R_assign = 0  -- Don't replace _ with <-
        vim.g.R_csv_app = 'terminal:vd'  -- Use visidata for viewing CSV files
        vim.g.R_rconsole_width = 0  -- Let R console expand to window width
        vim.g.R_min_editor_width = 80  -- Minimum editor width
        vim.g.R_objbr_w = 30  -- Object browser width

        -- Keyboard shortcuts
        vim.g.R_clear_line = 1  -- Smart backspace in R console
        vim.g.R_close_term = 1  -- Close terminal when R quits
        vim.g.R_source_args = "print.eval=TRUE"  -- Show output when sourcing

        -- Appearance
        vim.g.R_hi_fun = 1  -- Highlight R functions
        vim.g.R_hl_term = 1  -- Use R syntax highlighting in terminal
        vim.g.R_bracketed_paste = 1  -- Enable bracketed paste

        -- Custom key mappings
        local function map(mode, lhs, rhs, opts)
            local options = { noremap = true, silent = true }
            if opts then
                options = vim.tbl_extend("force", options, opts)
            end
            vim.keymap.set(mode, lhs, rhs, options)
        end

        -- Normal mode mappings


        -- R documentation lookup
        vim.g.R_nvimpager = "horizontal"  -- Split help window horizontally
        vim.g.R_help_w = 80  -- Help window width
    end,
}