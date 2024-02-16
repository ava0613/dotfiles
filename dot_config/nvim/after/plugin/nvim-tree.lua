
-- #### nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_width = 50
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_indent_markers = 1
--require("nvim-tree").setup({
require"nvim-tree".setup {
--    auto_open=1,
--    auto_close=1
  sort_by = "case_sensitive",
  view = {
    --adaptive_size = true,
    width = 50,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
}

