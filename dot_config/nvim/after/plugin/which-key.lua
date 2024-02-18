
-- #### which-key
local wk = require("which-key")
--.setup {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
--}
-- wk.register(mappings,  {
--     n = {
--         name = "line numbering",
--         a = {"<cmd>:set relativenumber!<cr>","toggle"}
--         }
--       }, { prefix = "<leader>" })
wk.register({
  ["a"] = { "<cmd>HopLineStart<CR>", "HopLineStart" },
  ["z"] = { "<cmd>HopPattern<CR>", "HopPattern " },
  ["d"] = { "<cmd>HopWord<CR>", "HopWord" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>lua require('lvim.utils.functions').smart_quit()<CR>", "Quit" },
  -- ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
  ["/"] = { "<cmd>:Commentary<cr>","Comment toggle" },
  ["c"] = { "<cmd>:bd<CR>", "Close Buffer" },
  ["p"] = { "<cmd>:Telescope neoclip<CR>", "neoclip" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["<tab>"] = { "<cmd>:Buffers<CR>", "Buffers" },
  ["<up>"] = { "<cmd>:Telescope buffers<CR>", "buffers" },
  ["<down>"] = { "<C-^>", "buffers" },
  ["<left>"] = { "<cmd>:BufferLineCyclePrev<CR>", "Pref buffer" },
  ["<right>"] = { "<cmd>:BufferLineCycleNext<CR>", "Next buffer" },
  ["<PageDown>"] = { "<cmd>:Telescope oldfiles<CR>", "oldfiles" },
  ["<home>"] = { "<cmd>:Telescope registers<CR>", "registers" },
  ["<end>"] = { "<cmd>:Telescope marks<CR>", "marks" },

  e = {
     name = "explorer - nvim-tree",
     w = {"<cmd>:NvimTreeFindFile<cr>","find file"},
     e = {"<cmd>:NvimTreeToggle<cr>","toggle"},
     },
  n = {
     name = "line numbering",
     n = {"<cmd>:set number!<cr>","toggle line numbers"},
     r = {"<cmd>:set relativenumber!<cr>","toggle relative numbers"},
     },
  f = {
     name = "Find with fzf",
     f = {"<cmd>:Files<cr>","Files"},
     d = {"<cmd>:Files %:p:h<cr>","files in buffer's dir"},
     b = {"<cmd>:Buffers<cr>","buffers"},
     g = {
         name = "git",
         s = {"<cmd>:GFiles?<cr>","GFiles"},
         b = {"<cmd>:BCommits<cr>","BCommits"},
         c = {"<cmd>:Commits<cr>","Commits"},
         f = {"<cmd>:GitFiles<cr>","GitFiles"},
         }
     },
  t = {name = 'Telescope',
    
    f = {"<cmd>lua require('telescope.builtin').find_files()<cr>",'Files'},
    d = {"<cmd>lua require('telescope.builtin').find_files({search_dirs={'%:p:h'}})<cr>",'Files fro buf'},
    e = {"<cmd>:Telescope file_browser path=%:p:h<cr>","file browser"},
    -- nnoremap <leader>tgc <cmd>lua require('telescope.builtin').git_commits()<cr>
    -- nnoremap <leader>fgr <cmd>lua require('telescope.builtin').git_branches()<cr>
    -- nnoremap <leader>tfb <cmd>lua require('telescope.builtin').buffers()<cr>
    g = {"<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>","fuzzy grep buffer"},
    H = {"<cmd>lua require('telescope.builtin').command_history()<cr>","command history"},
    h = {"<cmd>lua require('telescope.builtin').search_history()<cr>","search history"},
    o = {"<cmd>lua require('telescope.builtin').oldfiles()<cr>","oldfiles"},
    q = {"<cmd>lua require('telescope.builtin').quickfix()<cr>","quickfix"},
    Q = {"<cmd>lua require('telescope.builtin').quickfixhistory()<cr>","quickfix"},
-- nnoremap <leader>tC <cmd>lua require('telescope.builtin').commands()<cr>
--nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
      },
  v = {
     name = "Nvim config",
     e = {"<cmd>:e $MYVIMRC<cr>","edit init.vim"},
     s = {"<cmd>:source $MYVIMRC<cr>","source init.vim"},
     o = { "<cmd>Telescope colorscheme<cr>", "colorcheme /telescope" },
     n = {"<cmd>:Telescope file_browser path=~/.config/nvim/notes<cr>","notes of ava"},
  },
  g = {
    name = "Git",
    g = {"<cmd>:LazyGit<cr>","lz for the project"},
    --g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
    h = {"<cmd>:LazyGitFilterCurrentFile<cr>","lz for the buffer"},
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
  f = {name = "fugitive",
    g = {"<cmd>:Git status<cr>","Gstatus"},
    c = {"<cmd>:Git commit<cr>","Gcommit"},
    d = {"<cmd>:Git diff<cr>","Gdiff"},
    l = {"<cmd>:Git log<cr>","Glog"},
    p = {"<cmd>:Git pull<cr>","Gpull"},
    u = {"<cmd>:Git push<cr>","Gpush"},
    b = {"<cmd>:Git blame<cr>","Gblame"},
     }
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    D = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
    -- f = { require("lvim.lsp.utils").format, "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = { vim.diagnostic.goto_next, "Next Diagnostic", },
    k = { vim.diagnostic.goto_prev, "Prev Diagnostic", },
    c = { vim.lsp.codelens.run, "CodeLens Action" },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    r = { vim.lsp.buf.rename, "Rename" },
    y = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    Y = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    s = { "<cmd>LspStart<cr>", "LSP start" },
    x = { "<cmd>LspStop<cr>", "LSP stop" },
    l = {
            name = 'tmp',
            h = { vim.lsp.buf.hover, "Hover info" },
            d = { vim.lsp.buf.definition, "Goto definition" },
            D = { vim.lsp.buf.declaration, "Goto declaration" },
            i = { vim.lsp.buf.implementation, "Goto implementation " },
            o = { vim.lsp.buf.type_definition, "Type references" },
            r = { vim.lsp.buf.references, "References" },
            s = { vim.lsp.buf.signature_help, "Signature help" },
            R = { vim.lsp.buf.rename, "Rename" },
            F = { vim.lsp.buf.format, "Format buffer" },
            a = { vim.lsp.buf.code_action, "Code action" },
            l = { vim.diagnostic.open_float, "Diagnostics in a window" },
            p = { vim.diagnostic.goto_prev, "Goto prev diagnostic" },
            n = { vim.diagnostic.goto_next, "Goto next diagnostic"},
            -- K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().
            -- gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().
            -- gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
            -- gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().
            -- go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().
            -- gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().
            -- gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
            -- <F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().
            -- <F3>: Format code in current buffer. See :help vim.lsp.buf.format().
            -- <F4>: Selects a code action available at the current cursor position. See :help vim.lsp.buf.code_action().
            -- gl: Show diagnostics in a floating window. See :help vim.diagnostic.open_float().
            -- [d: Move to the previous diagnostic in the current buffer. See :help vim.diagnostic.goto_prev().
            -- ]d: Move to the next diagnostic. See :help vim.diagnostic.goto_next().
        }
  },
  x = {
    name = "xdemo", -- optional group name
    f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 1} , -- adritional options for creating the keymap
    n = { "New File" }, -- just a label. don't create any mapping
    e = "Edit File", -- same as above
    ["1"] = "which_key_ignore",  -- special label to hide it in the popup
    b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
  },
}, { prefix = "<leader>" })
