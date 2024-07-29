local status, saga = pcall(require, 'lspsaga')
local keymap = vim.keymap.set
if (not status) then return end

saga.setup({
  server_filetype_map = {},
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  definition_action_keys = {
    quit = 'q',
  },
  rename_action_quit = "<C-c>",
  show_outline = {
    win_position = 'right',
    --set special filetype win that outline window split.like NvimTree neotree
    -- defx, db_ui
    win_with = '',
    win_width = 30,
    auto_enter = true,
    auto_preview = true,
    virt_text = '┃',
    jump_key = 'o',
    auto_refresh = true,
  }, 
  finder_action_keys = {
    open = "o",
    vsplit = "sv",
    split = "sh",
    quit = "q",
  },
})

-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga finder<CR>", { silent = true })

-- Code action
keymap({"n","v"}, "ca", "<cmd>Lspsaga code_action<CR>", { silent = true })

-- Hover Doc
keymap({"n", "i"}, "<C-k>", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true })

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Peek Definition
keymap("n", "gD", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

-- Go to Definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })

-- Show cursor diagnostic
keymap("n", "ge", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

-- Next diagnostcs
keymap("n", "<leader>dd", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })
