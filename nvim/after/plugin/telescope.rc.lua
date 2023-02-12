local status, telescope = pcall(require, 'telescope')
if (not status) then return end

vim.g.theme_switcher_loaded = true

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
    file_ignore_patterns = {"node_modules/", "^./.git/", "^.git/", ".angular/"},
    path_display={"truncate"},
		imgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
  },
	extensions_list = { "themes", "terms" },
  extensions = {
    file_browser = {
      hijack_netrw = true,
			theme = 'dropdown',
      mappings = {
        -- custom mode mappings
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['D'] = fb_actions.remove,
					['R'] = fb_actions.rename,
          ['/'] = function () vim.cmd('startinsert') end
        }
      }
    }
  }
}

telescope.load_extension('file_browser')


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-p>', '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true, shorten_path = true })<cr>', opts)
vim.keymap.set('n', '<C-f>', '<cmd>lua require("telescope.builtin").live_grep({ no_ignore = false, hidden = true })<cr>', opts)

-- File Browser
vim.keymap.set('n', '<leader>f', '<cmd>lua require("telescope").extensions.file_browser.file_browser({ path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, inital_mode = "normal" })<cr>', opts)
