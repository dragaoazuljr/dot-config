local status, copilot = pcall(require, 'copilot')
if (not status) then return end

copilot.setup {
	panel = {
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = false,
    auto_trigger = false,
    debounce = 500,
    keymap = {
      accept = "<Tab>",
      accept_word = false,
      accept_line = false,
      next = "<M-p>",
      prev = "<M-p>",
      dismiss = "<C-p>",
    },
  },
  filetypes = {
    ["*"] = false,
		javascript = true,
		javacriptreact = true,
		typescript = true,
		typescriptreact = true,
		scss = true,
		html = true,
		dockerfile = true,
		css = true,
		java = true,
		lua = true,
		python = true,
		go = true,
		php = true,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {},
}
