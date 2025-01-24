return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { 
                "python",
                "r",           -- Add R language support
                "markdown",    -- For Rmd files (markdown portion)
                "yaml",        -- For Rmd YAML headers
            },
            highlight = {
                enable = true,
                -- This setting helps with Rmd files
                additional_vim_regex_highlighting = {
                    "markdown", -- Enable additional markdown highlighting
                    "r",       -- Enable additional R highlighting
                },
            },
            indent = {
                enable = true,
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
            fold = false -- disable folding
        })
    end,
}