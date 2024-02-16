
-- set runtimepath+=~/.fzf
vim.opt.runtimepath=vim.opt.runtimepath+'~/.fzf1'

vim.cmd [[
    let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.9 } }
    let $FZF_DEFAULT_OPTS="--preview-window 'right:57%' --preview 'bat --style=numbers --line-range :300 {}'
    \ --bind ctrl-p:preview-up,ctrl-n:preview-down,
    \ctrl-b:preview-page-up,ctrl-f:preview-page-down,
    \ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down,
    \ctrl-h:preview-top,ctrl-e:preview-bottom,
    \alt-up:half-page-up,alt-up:half-page-down"
]]
