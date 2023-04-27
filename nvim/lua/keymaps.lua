local keymap = vim.keymap

-- delete whole word backwards
keymap.set('i', '<C-h>', "<C-w>")

-- do not yank with d
keymap.set('n', 'd', '"_d')

-- Select All
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save
keymap.set('n', '<C-s>', ':w<Return>', { silent = true })
keymap.set('i', '<C-s>', '<C-[>:w<Return><Return>', { silent = true })

-- Tabs
keymap.set('n', '<C-n>', ':tabedit<Return>', { silent = true}) -- New tab
keymap.set('n', '<A-q>', ':-tabnext<Return>', { silent = true}) -- Previous tab
keymap.set('n', '<A-w>', ':tabn<Return>', { silent = true}) -- Next tab
keymap.set('n', 'sh', ':split<Return><C-w>w', { silent = true}) -- Split Horizontal
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true}) -- Split Horizontal
keymap.set('n', 'sw', '<C-w>k', { silent = true}) -- Move Up
keymap.set('n', 'ss', '<C-w>j', { silent = true}) -- Move Down
keymap.set('n', 'sa', '<C-w>h', { silent = true}) -- Move Left
keymap.set('n', 'sd', '<C-w>l', { silent = true}) -- Move Right
keymap.set('n', 'sq', ':wq<CR>', { silent = true}) -- Close tab
keymap.set('n', 's<up>', '<C-w>+', { silent = true}) -- Size tab Up
keymap.set('n', 's<down>', '<C-w>-', { silent = true}) -- Size tab Down
keymap.set('n', 's<right>', '<C-w><', { silent = true}) -- Size tab left
keymap.set('n', 's<left>', '<C-w>>', { silent = true}) -- Size tab right

-- Terminal
keymap.set('n', '<S-t>', ':term<CR>', {silent = true})
-- get out of Terminal mode
keymap.set('t', '<leader><Esc>', "<C-\\><C-n>")

--clear search highligh
keymap.set('n', '<CR>', ':noh<CR><CR>', { silent = true })

-- show current buffers
keymap.set('n', '<C-b>', ':Telescope buffers<CR>')

--Neogen
keymap.set("n", "<Leader>c", ":lua require('neogen').generate({ type = 'func'})<CR>", { noremap = true, silent = true})

--Indent file
keymap.set("n", "<Leader>i", "gg=G")

--Paste without yank deleted text
keymap.set("n", "p", "P")
