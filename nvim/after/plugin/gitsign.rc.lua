local status, gitsigns = pcall(require, 'gitsigns')
if (not status) then return end

gitsigns.setup {}

vim.keymap.set('n', '<leader>gc', ":Gitsigns preview_hunk<CR>", { silent = true })
vim.keymap.set('n', '<leader>gr', ":Gitsigns reset_hunk<CR>", { silent = true })
vim.keymap.set('n', '<leader>gb', ":Gitsigns blame_line<CR>", { silent = true })
vim.keymap.set('n', '<leader>gB', ":Gitsigns blame<CR>", { silent = true })
vim.keymap.set('n', '<leader>gD', function()
  local gitsigns = require('gitsigns')
  local blame_info = gitsigns.blame_line({ full = true })
  if blame_info and blame_info.commit and blame_info.commit ~= '' then
    vim.cmd('Gitsigns diffthis ' .. blame_info.commit)
  else
    print('Nenhum commit encontrado nesta linha')
  end
end, { silent = true })
