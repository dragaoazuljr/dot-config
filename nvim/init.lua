-- Install Packer: git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- Install typescript global: npm install -g typescript-language-server typescript
-- Install tree-setter: npm install -g tree-sitter-cli
-- Install prettierd: npm install -g @fsouza/prettierd

require('base')
require('highlights')
require('keymaps')
require('plugins')
require('reload')

local has = function(x)
	return vim.fn.has(x) == 1
end

local is_unix = has "unix"

if is_unix then
	require('unix')
end
