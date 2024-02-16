call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" statusline, and icons
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'


Plug 'kdheepak/lazygit.nvim'
Plug 'https://tpope.io/vim/commentary.git'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons' " for nvim-tree icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'flazz/vim-colorschemes'
Plug 'rose-pine/neovim'
Plug 'sainnhe/everforest'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'folke/which-key.nvim'  "menu for leader
Plug 'AckslD/nvim-neoclip.lua'  "clipboard 
Plug 'lewis6991/gitsigns.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'tpope/vim-fugitive'
Plug 'phaazon/hop.nvim'
"
" LSP0 >>>>>>>>>>>>>>   
" LSP Support
Plug 'neovim/nvim-lspconfig'                           " Required
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'L3MON4D3/LuaSnip'         " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
" <<<<<<<<<<<<<< LSP0

Plug 'folke/trouble.nvim'
" kept for ref,tried them out, didn't like,became obsolate'
" Plug 'xolox/vim-session'
" Plug 'airblade/vim-gitgutter'
" Plug 'https://github.com/vim-airline/vim-airline.git'
" Plug 'https://github.com/vim-airline/vim-airline-themes.git'
" Plug 'itchyny/lightline.vim'
call plug#end()


lua <<EOF
print("hello from init.vim")
-- require('init_ava')
require('ava')
EOF

" LEGACY - all worthy was moved to lua
""set t_Co=256
""set term='xterm-256color'
"set termguicolors
"set list lcs=trail:·,tab:»·
"" ¬ →  ⤦  ↩  
"set list lcs=tab:»·,eol:¬
"let $COLORTERM='gnome-terminal'
"colorscheme zenburn

" let mapleader=" "
" autoclose - instead of some fancy plugin
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap (( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O


" set runtimepath+=~/.fzf
" let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.9 } }

" let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
" \ --bind ctrl-p:preview-up,ctrl-n:preview-down,
" \ctrl-b:preview-page-up,ctrl-f:preview-page-down,
" \ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
" \ctrl-h:preview-top,ctrl-e:preview-bottom,
" \alt-up:half-page-up,alt-up:half-page-down"

" let g:lazygit_floating_window_winblend = 0 " transparency of floating window
" let g:lazygit_floating_window_scaling_factor = 0.96 " scaling factor for floating window
" let g:lazygit_floating_window_corner_chars = ['?', '?', '?', '?'] " customize lazygit popup window corner characters
" let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
" let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

" let g:lazygit_use_custom_config_file_path = 0 " config file path is evaluated if this value is 1
" let g:lazygit_config_file_path = '' " custom config file path

"set term-builtin_xterm
"nmap <Ctrl-V><Del> x
"imap <Ctrl-V><Del> <Ctrl-V><Esc>lxi
"fixdel

"nnoremap <leader>ee :NvimTreeFindFile<CR> "open netrw in dir of current file
"nnoremap <leader>ec :NvimTreeToggle<CR> "open netrw in dir of current file
""netrw
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 0
"let g:netrw_altv = 1
"nnoremap <leader>dd :Lexplore %:p:h<CR> "open netrw in dir of current file
"nnoremap <Leader>da :Lexplore<CR> "open netrw in the dir where vim started
" nnoremap f :HopChar1<CR> "find with hop
"function! NetrwMapping()
"  nmap <buffer> H u
"  nmap <buffer> h -^
"  nmap <buffer> l <CR>

"  nmap <buffer> . gh
"  nmap <buffer> P <C-w>z

"  nmap <buffer> L <CR>:Lexplore<CR>
"  nmap <buffer> <Leader>dd :Lexplore<CR>
"endfunction
"augroup netrw_mapping
"  autocmd!
"  autocmd filetype netrw call NetrwMapping()
"augroup END

"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
"augroup END

" nnoremap <Leader>vs :source $MYVIMRC<CR> " source init.vim
" nnoremap <Leader>ve :e $MYVIMRC<CR> " edit init.vim

" nnoremap <Leader>nn :set number!<CR> " toggle line numbers
" nnoremap <Leader>nr :set relativenumber!<CR> " toggle line numbers
"nnoremap <Leader>nn :nonumber<CR> " toggle line numbers



" nnoremap <leader>ff :Files<cr>
" nnoremap <leader>fd :Files %:p:h<cr>
" nnoremap <leader>fg :GFiles<cr>
" nnoremap <leader>fb :Buffers<cr>
" nnoremap <leader><tab> :Buffers<cr>

" nnoremap <leader>gs :GFiles?<cr>
" nnoremap <leader>gb :BCommits<cr>
" nnoremap <leader>gc :Commits<cr>
" nnoremap <leader>gf :GitFiles<cr>

" nnoremap <leader>hh :History<cr>
" nnoremap <leader>hc :History:<cr>
" nnoremap <leader>hs :History/<cr>


" nnoremap <leader>gg :LazyGit<cr>
" nnoremap <leader>gh :LazyGitFilterCurrentFile<cr>
" ----------------------------------------------------------------------------
" vim-fugitive FIMXE these
" ----------------------------------------------------------------------------
" nnoremap <Leader>xgs :Gstatus<CR>
" nnoremap <Leader>xgc :Gcommit<CR>
" nnoremap <Leader>xgd :Gdiff<CR>
" nnoremap <Leader>xgl :Glog<CR>
" nnoremap <Leader>xgp :Gpull<CR>
" nnoremap <Leader>xgu :Gpush<CR>
" nnoremap <Leader>xgb :Gblame<CR>

" nnoremap <leader>tff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fF <cmd>lua require('telescope.builtin').find_browser()<cr>
" nnoremap <leader>tgc <cmd>lua require('telescope.builtin').git_commits()<cr>
" nnoremap <leader>fgr <cmd>lua require('telescope.builtin').git_branches()<cr>
" nnoremap <leader>tfb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>ts <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
" nnoremap <leader>thc <cmd>lua require('telescope.builtin').command_history()<cr>
" nnoremap <leader>ths <cmd>lua require('telescope.builtin').search_history()<cr>
" nnoremap <leader>tC <cmd>lua require('telescope.builtin').commands()<cr>
"nnoremap <leader>fo <cmd>lua require('telescope.builtin').colorscheme()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"nnoremap <leader><tab> <cmd>lua require('telescope.builtin').buffers()<cr> 
" nnoremap <leader>z <C-^>
"previous tab


"<leader> - b - h :	Switch to the first buffer in the bufferlist
"<leader> - b - j :	Cycle to the next buffer in the bufferlist
"<leader> - b - k :	Cycle to the previous buffer in the bufferlist
"<leader> - b - l :	Switch to the last buffer in the bufferlist
"<leader> - b - d :	Delete current buffer


"set nocompatible            " disable compatibility to old-time vi
"set showmatch               " show matching 
"set ignorecase              " case insensitive 
"set mouse=v                 " middle-click paste with 
"set hlsearch                " highlight search 
"set incsearch               " incremental search
"set tabstop=4               " number of columns occupied by a tab 
"set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
"set expandtab               " converts tabs to white space
"set shiftwidth=4            " width for autoindents
"set autoindent              " indent a new line the same amount as the line just typed
"set number                  " add line numbers
""set number relativenumber
""set wildmode=longest,list   " get bash-like tab completions
"set cc=80                  " set an 80 column border for good coding style
"filetype plugin indent on   "allow auto-indenting depending on file type
"syntax on                   " syntax highlighting
""set mouse=a                 " enable mouse click
"set clipboard=unnamedplus   " using system clipboard
"set cursorline              " highlight current cursorline
"set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.


"<leader> - ~ :	Open Dashboard

"Ctrl - c :	Toggle line comment (multiple lines can be commented out in visual mode)
"<leader> - y - a :	Yank all text from selected buffer to system clipboard
"<leader/> - y - l :	Yank line to system clipboard.
"<leader/> - n - f :	Format buffer with neoformat.

"Ctrl - n :	Toggle line numbers.
"Ctrl - t :	Toggle nvimtree.

"Tab :	Cycle down through tab completion menu.
"Shift - Tab :	Cycle down through tab completion menu.
"Ctrl - e :	Close completion menu with completing anything.
"Ctrl - f :	Scroll up through documentation menu.
"Ctrl - d :	Scroll down through documentation menu.
":	Confirm completion.

" set encoding=utf-8

"fonts for airline
"let g:airline_powerline_fonts = 1
"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"" unicode symbols
""let g:airline_left_sep = '»'
""let g:airline_left_sep = '▶'
"let g:airline_left_sep = ''
""let g:airline_left_sep = "\ue602"
""let g:airline_right_sep = '«'
""let g:airline_right_sep = '◀'
"let g:airline_right_sep = ''
"let g:airline_symbols.crypt = '🔒'
""let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.maxlinenr = ''
""let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ' "press ga on a char to get its hexa
"let g:airline_symbols.readonly = ''
"" unicode symbols
""let g:airline_left_sep = "\u00bb"
""let g:airline_left_sep = "\u25b6"
""let g:airline_right_sep = "\u00ab"
""let g:airline_right_sep = "\u25c0"
""let g:airline_symbols.crypt = "\u0001f512"
""let g:airline_symbols.linenr = "\u240a"
""let g:airline_symbols.linenr = "\u2424"
""let g:airline_symbols.linenr = "\u00b6"
""let g:airline_symbols.branch = "\u2387"
""let g:airline_symbols.paste = "\u03c1"
""let g:airline_symbols.paste = "\u00de"
""let g:airline_symbols.paste = "\u2225"
""let g:airline_symbols.whitespace = "\u039e"
"" "" powerline symbols
""let g:airline_left_sep = ''
""let g:airline_left_alt_sep = ''
""let g:airline_right_sep = ''
""let g:airline_right_alt_sep = ''
""let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
""let g:airline_symbols.linenr = ''
"" let g:airline_left_sep ="\ue0b0" 
""let g:airline_left_alt_sep = "\ue0b1"
""let g:airline_right_sep = "\ue0b2"
""let g:airline_right_alt_sep = "\ue0b3"
""let g:airline_symbols.branch = "\ue0a0"
""let g:airline_symbols.readonly = "\ue0a2"
""let g:airline_symbols.linenr = "\ue0a1"
"" "" old vim-powerline symbols
""let g:airline_left_sep = '⮀'
""let g:airline_left_alt_sep = '⮁'
""let g:airline_right_sep = '⮂'
""let g:airline_right_alt_sep = '⮃'
""let g:airline_symbols.branch = '⭠'
""let g:airline_symbols.readonly = '⭤'
""let g:airline_symbols.linenr = '⭡'
"" let g:airline_symbols.space = "\ua0"
""let g:airline_theme='powerlineish'
""let g:airline_theme='molokai' 
""let g:airline_left_sep='<'
""let g:airline_right_sep='>'
""let g:airline_section_z='#' 

