-- Install Packer: git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim


require('base')
require('highlights')
require('keymaps')
require('plugins')

local has = function(x)
	return vim.fn.has(x) == 1
end

local is_unix = has "unix"

if is_unix then
	require('unix')
end
