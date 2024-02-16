
-- #### treesitter
require'nvim-treesitter.configs'.setup({
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<cr>",
            node_incremental = "<cr>",
            scope_incremental = "grc",
            node_decremental = "<backspace>",
            -- node_incremental = "grn",
            -- scope_incremental = "grc",
            -- node_decremental = "grm",
        } 
    },
})
