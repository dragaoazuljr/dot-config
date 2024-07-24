-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = '/home/danillom/projects/' .. project_name
--                                               ^^
--                                               string concattenation in Lua
local config = {
    cmd = {
			'jdtls',
		},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
-- require('jdtls').start_or_attach(config)
