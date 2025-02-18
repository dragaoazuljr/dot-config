local status, llm = pcall(require, 'llm') 
if (not status) then return end

llm.setup({
	backend = "ollama",
	--model = "codeqwen:code",
	model = "deepseek-coder-v2:16b-lite-base-q4_K_M",
	context_window = 4096,
	enable_suggestions_on_startup = true,
  enable_suggestions_on_files = "*",
	url = "http://192.168.0.14:11434",
	debounce_ms = 500,
  accept_keymap = "<C-Tab>",
  dismiss_keymap = "<S-Tab>",
	fim = {
    enabled = true,
		prefix = "<｜fim▁begin｜>",
    suffix = "<｜fim▁hole｜>",
    middle = "<｜fim▁end｜>",
		-- prefix = "<fim_prefix>",
    -- middle = "<fim_middle>",
    -- suffix = "<fim_suffix>",
  },	
	request_body = {
		options = {
			num_predict = 240,
			temperature = 0.4,
			top_p = 0.95,
		}
  },
})

