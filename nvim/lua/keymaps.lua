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

-- Copilot tab input
keymap.set("i", "<Tab>", function ()
local copilot = require('copilot.suggestion')
	if copilot.is_visible() then
		copilot.accept_line()
	else 
		local keys = vim.api.nvim_replace_termcodes('<Tab>', true, false, true)
		vim.api.nvim_feedkeys(keys, 'n', false)
	end
end,
{ noremap = true, silent = true})


--LLM.nvim
-- keymap.set("i", "<Tab>", function ()
-- 	local llm = require('llm.completion')
-- 
-- 	if llm.shown_suggestion ~= nil then
-- 		llm.complete()
-- 	else 
-- 		local keys = vim.api.nvim_replace_termcodes('<Tab>', true, false, true)
-- 		vim.api.nvim_feedkeys(keys, 'n', false)
-- 	end
-- end,
-- { noremap = true, silent = true})
-- keymap.set("n", "<M-]>", ":LLMSuggestion<CR>", { noremap = true, silent = true })
-- keymap.set("i", "<M-]>", "<Esc>:LLMSuggestion<CR>i", { noremap = true, silent = true })

-- find related method
keymap.set("n", "<M-f>", "vwhy<C-f><Esc><S-C-v>")



-- nvim-dap
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
	require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
	require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.scopes)
end)

