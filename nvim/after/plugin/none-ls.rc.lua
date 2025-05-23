local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

null_ls.setup {
  on_attach = function (client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
      vim.api.nvim_command [[augroup END]]
    end
  end,
  sources = {
    -- null_ls.builtins.diagnostics.eslint,
    require("none-ls.diagnostics.eslint"),
    null_ls.builtins.diagnostics.fish,
		-- null_ls.builtins.formatting.google_java_format
	}
}

