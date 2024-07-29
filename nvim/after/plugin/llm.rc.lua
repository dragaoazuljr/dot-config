local status, llm = pcall(require, 'llm') 
if (not status) then return end

llm.setup({
	backend = "ollama",
	model = "codeqwen:code",
	context_window = 8192,
	enable_suggestions_on_startup = true,
  enable_suggestions_on_files = "*",
	url = "http://localhost:11434",
	debounce_ms = 500,
  accept_keymap = "<S-Tab>",
  dismiss_keymap = "<C-Tab>",
	fim = {
    enabled = true,
    prefix = "<fim_prefix>",
    middle = "<fim_middle>",
    suffix = "<fim_suffix>",
  },	
	request_body = {
		options = {
			num_predict = 120,
			temperature = 0.9,
			top_p = 0.95,
		}
  },
})

