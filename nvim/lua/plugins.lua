local status, packer = pcall(require, 'packer')

if (not status) then
	print("Packer is not installed")
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use           'wbthomason/packer.nvim'
	use {
		'svrana/neosolarized.nvim',
		requires = { 'tjdevries/colorbuddy.nvim' }
	}

  use 'kyazdani42/nvim-web-devicons' -- file web icons
  use 'glepnir/lspsaga.nvim'
  use 'L3MON4D3/LuaSnip'
  use 'hoob3rt/lualine.nvim' -- Statusline
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  
  -- Themes
  use 'baliestri/aura-theme'
  use 'folke/tokyonight.nvim'
  use 'shaunsingh/nord.nvim'
	use 'Mofiqul/dracula.nvim'
	use 'nvimtools/none-ls-extras.nvim'
  use 'nvimtools/none-ls.nvim' -- Use neovim as Language Server
  use 'MunifTanjim/prettier.nvim' -- prettier

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- Hop - Easymotion for nvim
  use 'phaazon/hop.nvim'

  use 'lewis6991/gitsigns.nvim'

 -- use {
 --   'VonHeikemen/fine-cmdline.nvim',
 --   requires = {
 --     {'MunifTanjim/nui.nvim'}
 --   }
 -- }
	
	use 'gelguy/wilder.nvim'

  use 'norcalli/nvim-colorizer.lua'
  use 'rktjmp/lush.nvim'

  -- neogen
  use {
    'danymat/neogen',
    requires = 'nvim-treesitter/nvim-treesitter'
  }

	-- AI
	-- Copilot.vim
	-- use 'dragaoazuljr/copilot.vim'
	
	-- Copilot.lua
	-- use 'dragaoazuljr/copilot.lua'
	
	use 'zbirenbaum/copilot.lua'
	-- use { 
	-- 	'zbirenbaum/copilot-cmp', 
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({})
	-- 	end,
	-- }

	use 'huggingface/llm.nvim'

	use {
		"olimorris/codecompanion.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		}
	}

	-- Java
	use 'nvim-neotest/nvim-nio'
	use 'mfussenegger/nvim-dap'

	use {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  }

	use {
		'mfussenegger/nvim-jdtls',
		dependencies = {
			'mfussenegger/nvim-dap',
		}
	}

	--PHP
	use {
    'gbprod/phpactor.nvim',
    build = function()
      require('phpactor.handler.update')()
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig'
    },
    opts = {
      -- you're options coes here
    },
  }

end)
