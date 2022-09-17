local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    mapping = {
      ['q'] = actions.close
    },
    file_ignore_patterns = {"node_modules/", "^.git/"}
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
      mappings = {
        -- custom mode mappings
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['D'] = fb_actions.remove,
          ['/'] = function () vim.cmd('startinsert') end
        }
      }
    }
  }
}

telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-p>', '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true, layout_config = { height = 100 }})<cr>', opts)
vim.keymap.set('n', '<C-f>', '<cmd>lua require("telescope.builtin").live_grep({ no_ignore = false, hidden = true, layout_config = { height = 100 }})<cr>', opts)

-- File Browser
vim.keymap.set('n', '<leader>f', '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, inital_mode = "normal", layout_config = { height = 40 } })<cr>', opts)
