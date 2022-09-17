local status, hop = pcall(require, 'hop')
if (not status) then return print('nooo') end

hop.setup {
  keys = 'asdfhjklqweruiop'
}

local keymap = vim.keymap.set

keymap('n', '<Space>', ':HopWord<CR>', { silent = true })
