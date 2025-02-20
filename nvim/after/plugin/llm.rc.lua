local status, llm = pcall(require, 'llm') 
if (not status) then return end

llm.setup({
	backend = "ollama",
	--model = "codeqwen:code",
	--model = "deepseek-coder-v2:16b-lite-base-q4_K_M",
	--model = "llama3.1:8b-instruct-q8_0",
	model = "qwen2.5-coder:3b-base-q4_1",
	context_window = 8092,
	enable_suggestions_on_startup = true,
  enable_suggestions_on_files = {
		"*.js",
		"*.ts",
		"*.java",
		"*.py",
		"*.lua",
		"*.html",
		"*.scss",
		"*.css",
		"*.go",
		"*.php",
		"*.jsx",
		"*.tsx"
	},
	-- url = "http://192.168.0.14:11434",
	url = "http://0.0.0.0:11434",
	debounce_ms = 500,
  accept_keymap = "<C-Tab>",
  dismiss_keymap = "<S-Tab>",
	fim = {
    enabled = true,
		-- Deepseek coder
		--prefix = "<｜fim▁begin｜>",
    --suffix = "<｜fim▁hole｜>",
    --middle = "<｜fim▁end｜>",

		-- Qwen 
		prefix = "<|fim_prefix|>",
    suffix = "<|fim_suffix|>",
    middle = "<|fim_middle|>",
  },	
	request_body = {
		options = {
			num_predict = 240,
			temperature = 0.4,
			top_p = 0.95,
		}
  },
})

