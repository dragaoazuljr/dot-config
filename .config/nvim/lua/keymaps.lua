local keymap = vim.keymap

-- delete whole word backwards
keymap.set('i', '<C-h>', "<C-w>")

-- do not yank with d
keymap.set('n', 'd', '"_d')

-- Select All
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save
keymap.set('n', '<C-s>', ':w<Return>')

-- Tabs
keymap.set('n', '<C-n>', ':tabedit<Return>', { silent = true}) -- New tab
keymap.set('n', '<A-q>', ':-tabnext<Return>', { silent = true}) -- Previous tab
keymap.set('n', '<A-w>', ':tabn<Return>', { silent = true}) -- Next tab
keymap.set('n', 'sh', ':split<Return><C-w>W', { silent = true}) -- Split Horizontal
keymap.set('n', 'sv', ':vsplit<Return><C-w>W', { silent = true}) -- Split Horizontal
keymap.set('n', 'sw', '<C-w>k', { silent = true}) -- Move Up
keymap.set('n', 'ss', '<C-w>j', { silent = true}) -- Move Down
keymap.set('n', 'sa', '<C-w>h', { silent = true}) -- Move Left
keymap.set('n', 'sd', '<C-w>l', { silent = true}) -- Move Right
keymap.set('n', 's<up>', '<C-w>+', { silent = true}) -- Size tab Up
keymap.set('n', 's<down>', '<C-w>-', { silent = true}) -- Size tab Down
keymap.set('n', 's<right>', '<C-w><', { silent = true}) -- Size tab left
keymap.set('n', 's<left>', '<C-w>>', { silent = true}) -- Size tab right
