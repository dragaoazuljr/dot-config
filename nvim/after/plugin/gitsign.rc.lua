local status, gitsigns = pcall(require, 'gitsigns')
if (not status) then return end

gitsigns.setup {}

vim.keymap.set('n', '<leader>gc', ":Gitsigns preview_hunk<CR>", { silent = true })
vim.keymap.set('n', '<leader>gr', ":Gitsigns reset_hunk<CR>", { silent = true })
vim.keymap.set('n', '<leader>gb', ":Gitsigns toggle_current_line_blame<CR>", { silent = true })
