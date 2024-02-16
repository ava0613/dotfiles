
local builtin = require('telescope.builtin')
vim.keymap.set('n','<leader>ps', function()
    builtin.grep_string({search = vim.fn.input("Grep > ")});
end)

local actions = require('telescope.actions')
require "telescope".setup {
    defaults = {
      --prompt_prefix = lvim.icons.ui.Telescope .. " ",
      --selection_caret = lvim.icons.ui.Forward .. " ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "descending",
      layout_strategy = "horizontal",
      layout_config = {
        width = 0.95,
        height = 0.95,
        preview_cutoff = 120,
        horizontal = {
          preview_width = function(_, cols, _)
            if cols < 120 then
              return math.floor(cols * 0.5)
            end
            return math.floor(cols * 0.6)
          end,
          mirror = false,
        },
        vertical = { mirror = false },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
    mappings = {
        i = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          ["<C-c>"] = actions.close,
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          ["<CR>"] = actions.select_default,
          ["<PageUp>"] = actions.preview_scrolling_up,  -- custom override pgup,pgdown
          ["<PageDown>"] = actions.preview_scrolling_down,  -- custom override pgup,pgdown
        },
        n = {
          ["<C-n>"] = actions.move_selection_next,
          ["<C-p>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        },
      },
    },
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}
require('telescope').load_extension('neoclip')
require("telescope").load_extension "file_browser"
