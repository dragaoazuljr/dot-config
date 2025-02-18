local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end
end

local omnisharp_bin = os.getenv("HOME") .. "/.bin/run"
local pid = vim.fn.getpid()

nvim_lsp.ts_ls.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact" },
  cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.pyright.setup {}

local on_attach_go = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

nvim_lsp.gopls.setup({
	on_attach = on_attach_go,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
})

--PHP
nvim_lsp.phpactor.setup{}

--Java
--
-- create env var to use lombok 
-- export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/java/lombok.jar"

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/home/danillom/projects/' .. project_name
--                                               ^^
--                                               string concattenation in Lua

local config = {
    cmd = {
			'jdtls',
			"-data", workspace_dir
		},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
		init_options = {
			bundles = {
				vim.fn.glob("home/danillom/apps/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1)
			};
		},
		on_attach = function(client, bufnr)
          require("jdtls").setup_dap({ hotcodereplace = "auto" })
          require("jdtls.dap").setup_dap_main_class_configs()
          require("jdtls").add_commands()
					require('dap.ext.vscode').load_launchjs()
		end,
}

nvim_lsp.jdtls.setup{config}


-- nvim_lsp.omnisharp.setup {
--   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--   cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
--   filetypes = {"cs"},
--   on_attach = function (_, bufnr) 
--     vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--   end,
-- }
