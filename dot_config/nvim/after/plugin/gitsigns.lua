
require('gitsigns').setup()

require('hop').setup( {
    -- keys = 'etovxqpdygfblzhckisuran',
    perm_method = TrieBacktrackFilling,
    -- keys = 'asdghklqwertyuiopzxcvbASDGHKLQWERTYUIOPZXCVBNMFJnmfj'
    keys = 'asdghklqwertyuiopzxcvbnmfj',
    -- keys = 'etovxqpdygfblzhckisETOVXQPDYGFBLZHCKISURANuran',
    uppercase_labels = true,
})
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})

