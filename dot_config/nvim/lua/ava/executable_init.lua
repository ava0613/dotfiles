print('hello from lua/ava')

-- a--------------------------------------------------------------
-- REMAPS
vim.g.mapleader = " "

-- poor man's surround
vim.keymap.set('i','""', '"<left>"')
vim.keymap.set('i',"''", "'<left>'")
vim.keymap.set('i','((', '()<left>')
vim.keymap.set('i','[[', '[]<left>')
vim.keymap.set('i','{{', '{}<left>')
-- inoremap {<CR> {<CR>}<ESC>O
-- inoremap {;<CR> {<CR>};<ESC>O

-- keep current line in the middle of the screnn when moving half page or " searching↲
vim.keymap.set('n','<C-d>',' <C-d>zz')
vim.keymap.set('n','<C-u>',' <C-d>zz')
vim.keymap.set('n','n','nzzzv')
vim.keymap.set('n','N','Nzzzv')

vim.keymap.set('n','<C-e>',' <C-e>')
vim.keymap.set('n','<C-y>',' <C-y>')
----------------------------------------------------------------
-- SETS
--
-- term stuff
--set t_Co=256
--set term='xterm-256color'
vim.o.termguicolors=true
-- let $COLORTERM='gnome-terminal'
vim.cmd('colorscheme zenburn')

-- invisible chars
vim.opt.list=true
vim.opt.listchars = {eol = '↲', tab = '» ', trail = '·'}
-- ¬ →  ⤦  ↩  ↲ ▸
-- set list lcs=trail:·,tab:»·
-- set list lcs=tab:»·,eol:¬

-- folding 
-- opt.foldmethod = "indent"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

vim.o.encoding='utf-8'
vim.o.mouse='v'                  -- middle-click paste with 
-- vim.o.tabstop=4                -- number of columns occupied by a tab 
-- vim.o.softtabstop=4            -- see multiple spaces as tabstops so <BS> does the right thing
-- vim.o.expandtab=true       -- converts tabs to white space
-- vim.o.shiftwidth=4             -- width for autoindents
vim.o.autoindent=true          -- indent a new line the same amount as the line just typed
vim.o.number = true            -- add line numbers
vim.o.cc=80                    -- set an 80 column border for good coding style
-- set nocompatible            " disable compatibility to old-time vi
-- set showmatch               " show matching 
-- set ignorecase              " case insensitive 
-- set hlsearch                " highlight search 
-- set incsearch               " incremental search
-- "set number relativenumber
-- "set wildmode=longest,list   " get bash-like tab completions
-- filetype plugin indent on   "allow auto-indenting depending on file type
-- syntax on                   " syntax highlighting
-- "set mouse=a                 " enable mouse click
-- set clipboard=unnamedplus   " using system clipboard
-- set cursorline              " highlight current cursorline
-- set ttyfast                 " Speed up scrolling in Vim

-- from the primagaen
-- vim.opt.guicursor = ""  -- block cursor in insert mode

vim.opt.nu = true
-- vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.cmd('hi Visual  guifg=None guibg=Black gui=none')
vim.cmd('hi Search  guifg=Black guibg=LightYellow gui=none')

vim.opt.scrolloff = 8   -- keep at least 8 rows at the top/bottom when scrolling
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- fold stuff
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = -1
vim.opt.foldenable = true

-- move around visually selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "J", "mzJ`z") -- keep cursor in place when joining lines
-- keep cursorline centered while scrollig
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keep search terms in the middle while sarching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- keeps the yanked text in the register when pasting over a selected text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank into system clipboard,but does not work for me ,ava
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- -- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quickfix navigation, 
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace all occurences of current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- makes the file ot the current buffer executable, o
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- .keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

