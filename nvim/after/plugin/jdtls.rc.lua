-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
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
		}
}

config['on_attach'] = function(client, bufnr)
	require('jdtls.setup').setup_dap({ hotcodereplace = 'auto' })
end

-- require('jdtls').start_or_attach(config)
